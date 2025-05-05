import 'dart:io';

import 'package:camera/camera.dart';
import 'package:farmfix/features/camera/presentation/views/widgets/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../logic/image_preprocessing.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;
  List<CameraDescription>? cameras;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    _cameraController = CameraController(cameras![0], ResolutionPreset.medium);
    await _cameraController!.initialize();
    if (mounted) setState(() {});
  }

  Future<void> captureImage() async {
    final image = await _cameraController!.takePicture();
    final imageFile = File(image.path);
    setState(() => _imageFile = imageFile);

    final interpreter = await loadModel();
    final labels = await loadLabels();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          imageFile: imageFile,
          interpreter: interpreter,
          labels: labels,
        ),
      ),
    );
  }

  Future<void> pickImageFromGallery() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      final imageFile = File(picked.path);
      setState(() => _imageFile = imageFile);

      final interpreter = await loadModel();
      final labels = await loadLabels();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            imageFile: imageFile,
            interpreter: interpreter,
            labels: labels,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  _cameraController != null && _cameraController!.value.isInitialized
          ? CameraPreview(
          _cameraController!,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 2,
                backgroundColor: Colors.transparent,
                centerTitle: true,
                title: const Text('Discover Diseases',style: TextStyle(color: Colors.white),),
                automaticallyImplyLeading: false,
                actions: [
                  InkWell(
                    onTap: (){GoRouter.of(context).pop();},

                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.close,color: Colors.white,size: 30,),
                    ),)
                ],
              ),

              body: Stack(children: [
                    Positioned(
                      bottom: 30,
                      left: MediaQuery.of(context).size.width / 2 - 35,
                      child: GestureDetector(
                        onTap: captureImage,
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 45,
                      left: 30,
                      child: GestureDetector(
                        onTap: pickImageFromGallery,
                        child: const Icon(Icons.image, color: Colors.white, size: 30),
                      ),
                    ),
                  ],),
              ),
              )
          : const Center(child: CircularProgressIndicator());
  }
}

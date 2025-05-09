import 'dart:io';

import 'package:camera/camera.dart';
import 'package:farmfix/features/camera/presentation/views/widgets/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/widgets/show_help_dialog.dart';
import '../../../logic/image_preprocessing.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  CameraScreenState createState() => CameraScreenState();
}

class CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;
  List<CameraDescription>? cameras;
   late File? _imageFile;

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

                backgroundColor: Colors.black54,
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

              // body: Stack(children: [
              //       Positioned(
              //         bottom: 30,
              //         left: MediaQuery.of(context).size.width / 2 - 35,
              //         child: GestureDetector(
              //           onTap: captureImage,
              //           child: Container(
              //             width: 70,
              //             height: 70,
              //             decoration: const BoxDecoration(
              //               shape: BoxShape.circle,
              //               color: Colors.white,
              //             ),
              //           ),
              //         ),
              //       ),
              //       Positioned(
              //         bottom: 45,
              //         left: 30,
              //         child: GestureDetector(
              //           onTap: pickImageFromGallery,
              //           child: const Icon(Icons.image, color: Colors.white, size: 30),
              //         ),
              //       ),
              //     ],),
              bottomNavigationBar: Container(
                height: 200,
                decoration: const BoxDecoration(color: Colors.black54),
                child: Stack(children: [
                  Positioned(
                    bottom: 45,
                    left: MediaQuery.of(context).size.width / 2 - 35,
                    child: GestureDetector(
                      onTap: captureImage,
                      child: Container(
                        width: 70,
                        height: 70, 
                        // padding: EdgeInsets.all(4),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white,width: 4)
                        ),
                        child: const Icon(Icons.circle,color: Colors.white,size: 62,),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 55,
                    left: 30,
                    child: GestureDetector(
                      onTap: pickImageFromGallery,
                      child: const Icon(Icons.image, color: Colors.white, size: 30),
                    ),
                  ),
                  Positioned(
                    bottom: 45,
                    right: 30,
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const ShowHelpDialog(
                              title: 'Tips for capturing a clear image',
                              description:
                              '1. Make sure the infected leaf or area is clearly visible.\n'
                              '\n2. Use good lighting with no shadows or glare.\n'
                              '\n3. Focus on the affected part without background distractions.',
                            );
                          },
                        );
                      },
                      icon: Iconify(
                        Ic.twotone_help,
                        color: Colors.white,
                        size: 35.sp,
                      ),
                    ),
                  ),
                ],),),
              ),
              )
          : const Center(child: CircularProgressIndicator());
  }
}

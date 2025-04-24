import 'package:farmfix/features/camera/presentation/views/widgets/camera_view.dart';
import 'package:flutter/material.dart';

class CameraViewBody extends StatelessWidget {
  const CameraViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CameraScreen(),
      ],
    );
  }
}

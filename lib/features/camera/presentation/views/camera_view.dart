import 'package:farmfix/features/camera/presentation/views/widgets/camera_view_body.dart';
import 'package:flutter/material.dart';

class CameraView extends StatelessWidget {
  const CameraView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CameraViewBody(),

    );
  }
}

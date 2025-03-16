import 'dart:ui';

import 'package:flutter/material.dart';

class BlurLayer extends StatelessWidget {
  const BlurLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter:
          ImageFilter.blur(sigmaX: 0, sigmaY: 30, tileMode: TileMode.decal),
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: 430,
          padding: EdgeInsets.zero,
          decoration: const BoxDecoration(
              color: Color(0xffFBF6E9),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(85),
                  topRight: Radius.circular(85)))),
    );
  }
}

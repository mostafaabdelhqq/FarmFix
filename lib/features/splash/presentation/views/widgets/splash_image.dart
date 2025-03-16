import 'dart:ui';

import 'package:farmfix/core/utils/assets_data.dart';
import 'package:flutter/material.dart';

class SplashImage extends StatelessWidget {
  const SplashImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: .8,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(
                sigmaX: 50, sigmaY: 50, tileMode: TileMode.decal),
            child: Container(
              height: 400,
              width: 430,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  color: const Color(0xffFBF6E9),
                  borderRadius: BorderRadius.circular(35)),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 0, left: 34, right: 34),
            child: Image.asset(
              AssetsData.Logo,
              height: MediaQuery.of(context).size.height * .55,
            ),
          )
        ],
      ),
    );
  }
}

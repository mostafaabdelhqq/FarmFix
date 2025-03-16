import 'dart:ui';

import 'package:farmfix/core/utils/assets_data.dart';
import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

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
                height: 220,
                width: 255,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: const Color(0xffFBF6E9),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 75, right: 75),
            child: Image.asset(
              AssetsData.Logo,
              height: MediaQuery.of(context).size.height * .27,
            ),
          ),
        ],
      ),
    );
  }
}

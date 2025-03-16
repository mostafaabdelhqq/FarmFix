import 'package:farmfix/core/utils/assets_data.dart';
import 'package:flutter/material.dart';

class LogoAndName extends StatelessWidget {
  const LogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    var image = Image.asset(
      AssetsData.Logo,
      width: MediaQuery.of(context).size.width * .23,
    );
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        image,
        const SizedBox(
          height: 10,
        ),
        Image.asset(
          AssetsData.FarmFixText,
          width: MediaQuery.of(context).size.width * .34,
        ),
      ],
    );
  }
}

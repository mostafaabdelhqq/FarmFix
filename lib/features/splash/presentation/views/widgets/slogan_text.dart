import 'package:farmfix/constants.dart';
import 'package:flutter/material.dart';

class SloganText extends StatelessWidget {
  const SloganText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 5, left: 92),
          child: SizedBox(
            width: 246,
            height: 60,
            child: Text('FarmFix',
                style: TextStyle(
                  fontFamily: KJersey25,
                  fontSize: 50,
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 5, left: 70),
          child: SizedBox(
            width: 327,
            height: 60,
            child: Text('Detect. Protect. Grow',
                style: TextStyle(
                    fontFamily: KJersey25,
                    fontSize: 30,
                    color: Color(0xffFBF6E9))),
          ),
        )
      ],
    );
  }
}

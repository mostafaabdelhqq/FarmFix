import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TwoTextDefineThisView extends StatelessWidget {
  const TwoTextDefineThisView(
      {super.key, required this.Text1, required this.Text2});
  final String Text1;
  final String Text2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(Text1,
            style: GoogleFonts.inter(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: const Color(0xff009951))),
        const SizedBox(
          height: 10,
        ),
        Text(Text2,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: const Color(0xff5C5C5C),
            ))
      ],
    );
  }
}

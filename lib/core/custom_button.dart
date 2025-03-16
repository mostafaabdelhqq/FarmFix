import 'package:farmfix/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      required this.textButton,
      this.borderRadius = const BorderRadius.all(Radius.circular(8)),
      this.onPressed});

  final void Function()? onPressed;
  final String textButton;
  final BorderRadius borderRadius;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width * .9,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(KPrimaryColor),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: borderRadius,
              ))),
          onPressed: onPressed,
          child: Center(
              child: Text(
            textButton,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ))),
    );
  }
}

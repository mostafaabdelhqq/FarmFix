import 'package:farmfix/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.obscureText = false,
    this.width = .9,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    required this.controller,
  });
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  final double width;
  final BorderRadius borderRadius;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width * width,
        child: TextFormField(
          textInputAction: TextInputAction.next,
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
          obscureText: obscureText,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Color(0xffB3B3B3),
              overflow: TextOverflow.visible,
            ),
            border: OutlineInputBorder(
              borderRadius: borderRadius,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimaryColor),
              borderRadius: borderRadius,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: borderRadius,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: borderRadius,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: borderRadius,
            ),
          ),
        ),
      ),
    );
  }
}

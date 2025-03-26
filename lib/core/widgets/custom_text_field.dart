import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.hintText,
      this.ObscureText = false,
      this.icon,
      this.width = .9,
      this.borderRadius = const BorderRadius.all(Radius.circular(8)),
      this.validator,
      required this.controller});
  final TextEditingController controller;
  final String hintText;
  final bool ObscureText;
  final Widget? icon;
  final double width;
  final BorderRadius borderRadius;
  final _formKey = GlobalKey<FormState>();
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width * width,
        decoration:
            BoxDecoration(color: Colors.white, borderRadius: borderRadius),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Form(
            key: _formKey,
            child: TextFormField(
              controller: controller,
              validator: validator,
              obscureText: ObscureText,
              decoration: InputDecoration(
                suffixIcon: icon,
                hintText: hintText,
                hintStyle: const TextStyle(
                    color: Color(0xffB3B3B3), overflow: TextOverflow.visible),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

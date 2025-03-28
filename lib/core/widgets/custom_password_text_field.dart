import 'package:farmfix/constants.dart';
import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({
    super.key,
    required this.hintText,
    this.obscureText = true,
    this.icon,
    this.width = .9,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    required this.controller,
  });

  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Widget? icon;
  final double width;
  final BorderRadius borderRadius;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width * widget.width,
        child: TextFormField(
          textInputAction: TextInputAction.done,
          controller: widget.controller,
          validator: (value) {
            if (value!.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
          obscureText: _isObscured,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(10),
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: Color(0xffB3B3B3),
            ),
            border: OutlineInputBorder(
              borderRadius: widget.borderRadius,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: kPrimaryColor),
              borderRadius: widget.borderRadius,
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: widget.borderRadius,
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red),
              borderRadius: widget.borderRadius,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: widget.borderRadius,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isObscured = !_isObscured;
                });
              },
              icon: _isObscured
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

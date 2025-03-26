import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatefulWidget {
  CustomPasswordTextField(
      {super.key,
      required this.hintText,
      this.ObscureText = true,
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
  final String? Function(String?)? validator;

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  final _formKey = GlobalKey<FormState>();

  var _isObscured;

  void initState() {
    super.initState();

    _isObscured = true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width * widget.width,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: widget.borderRadius),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Form(
              key: _formKey,
              child: TextFormField(
                controller: widget.controller,
                validator: widget.validator,
                obscureText: _isObscured!,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
                      color: Color(0xffB3B3B3), overflow: TextOverflow.visible),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
      ),
      Positioned(
        left: 320,
        top: 1,
        bottom: 1,
        child: IconButton(
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
          icon: _isObscured!
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
          color: Colors.black,
        ),
      )
    ]);
  }
}

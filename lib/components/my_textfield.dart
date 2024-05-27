import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final String labelText;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? preffixIcon;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.preffixIcon,
      required this.suffixIcon,
      required this.obscureText,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            labelText: labelText,
            suffixIcon: suffixIcon,
            prefixIcon: preffixIcon,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../themes/themes.dart';

class InputText extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? validatorMessage;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? maxLength;

  final bool obscureText;

  const InputText({
    Key? key,
    required this.controller,
    this.validatorMessage,
    this.keyboardType,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.obscureText = false,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: colorPrimary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: colorGrey,
          ),
        ),
      ),
      maxLines: maxLines,
      validator: (value) {
        if (value!.isEmpty) {
          return validatorMessage;
        } else {
          return null;
        }
      },
    );
  }
}
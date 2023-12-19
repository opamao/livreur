import 'package:flutter/material.dart';

import '../../themes/themes.dart';
import 'input_text.dart';

class InputPassword extends StatefulWidget {
  final TextEditingController controller;
  final String validatorMessage;
  final String? hintText;
  final Widget? prefixIcon;
  final int? maxLines;

  const InputPassword({
    Key? key,
    required this.controller,
    required this.validatorMessage,
    this.hintText,
    this.prefixIcon,
    required IconButton suffixIcon,
    this.maxLines,
  }) : super(key: key);

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return InputText(
      controller: widget.controller,
      validatorMessage: widget.validatorMessage,
      obscureText: _obscure,
      prefixIcon: widget.prefixIcon,
      hintText: widget.hintText,
      suffixIcon: IconButton(
        icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility, color: colorPrimary,),
        onPressed: () {
          setState(
                () {
              _obscure = !_obscure;
            },
          );
        },
      ),
      maxLines: widget.maxLines ?? 1,
    );
  }
}
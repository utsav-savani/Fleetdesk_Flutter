import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType? keyBoardType;
  final String? labelText;
  final bool? filled;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final FormFieldValidator<String>? validator;

  const TextFieldWidget({
    super.key,
    this.errorText,
    this.inputFormatters,
    this.controller,
    this.hintText,
    this.keyBoardType,
    this.labelText,
    this.filled,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 12),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            filled: filled,
            border: const OutlineInputBorder(),
            hintText: hintText,
            labelText: labelText,
            errorText: errorText),
        keyboardType: keyBoardType,
        inputFormatters: inputFormatters,
      ),
    );
  }
}

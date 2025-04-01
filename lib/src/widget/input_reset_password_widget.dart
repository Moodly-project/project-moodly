import 'package:flutter/material.dart';

class InputResetPasswordWidget extends StatelessWidget {
  final String hint;
  final bool obscure;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const InputResetPasswordWidget(
      {required this.hint,
      required this.obscure,
      required this.controller,
      this.validator,
      super.key,
      required TextInputType keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: hint,
            labelStyle: const TextStyle(color: Colors.black),
            hintStyle: const TextStyle(color: Colors.black54),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black54),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
          obscureText: obscure,
          style: const TextStyle(color: Colors.black),
          validator: validator,
        ),
      ),
    );
  }
}

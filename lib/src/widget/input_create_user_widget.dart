import 'package:flutter/material.dart';

class InputCreateUserWidget extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool obscure;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const InputCreateUserWidget({
    required this.hint,
    required this.icon,
    required this.obscure,
    required this.controller,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white),
          labelText: hint,
          labelStyle: const TextStyle(color: Colors.white),
          hintStyle: const TextStyle(color: Colors.white),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        obscureText: obscure,
        style: const TextStyle(color: Colors.white),
        validator: validator,
      ),
    );
  }
}

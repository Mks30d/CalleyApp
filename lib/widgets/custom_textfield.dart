import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String labelText;
  final IconData suffixIcon;
  final TextEditingController controller;
  final bool obscureText;
  final bool focus;
  final String? Function(String?)? validator;


  const CustomTextfield({
    super.key,
    required this.labelText,
    required this.suffixIcon,
    required this.controller,
    this.obscureText = false, this.validator, this.focus = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 8, 18, 5),
      child: TextFormField(
        controller: controller,
        canRequestFocus: focus,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          labelText: labelText,
          suffixIcon: Icon(suffixIcon),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}

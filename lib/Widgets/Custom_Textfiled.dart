import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  Customtextfield({
    super.key,
    required this.controller,
    required this.keyboardType,
    this.validator,
    required this.ispass,
    required this.label,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
  });
  final TextEditingController controller;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final bool ispass;
  final String label;
  final String hint;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      
      obscureText: ispass,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(prefixIcon,color: Colors.blue,),
        suffixIcon: Icon(suffixIcon,color: Colors.blue,),
        labelText: label,
        hintText: hint,
      ),
    );
  }
}

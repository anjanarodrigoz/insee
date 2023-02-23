import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final obscureText;
  final height;
  final width;
  final radius;

  const CustomTextFormField(
      {Key? key,
      required this.labelText,
      this.onSaved,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.height = 50.0,
      this.width = double.infinity,
      this.radius = 20.0,
      this.onChanged,
      this.validator,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        cursorHeight: 20.0,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade600, width: 1.0),
            borderRadius: BorderRadius.circular(radius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        keyboardType: keyboardType,
        validator: validator,
        onSaved: onSaved,
        obscureText: obscureText,
        onChanged: onChanged,
      ),
    );
  }
}

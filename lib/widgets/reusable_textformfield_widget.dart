import 'package:flutter/material.dart';

class ReusableTextFormField extends StatelessWidget {
  TextEditingController controller;
  String hint;
  Icon? prefixIcon;
  ReusableTextFormField(
      {Key? key, required this.controller, required this.hint,this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: 45,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            prefixIcon: prefixIcon ?? null,
            fillColor: Colors.grey.shade300,
            border: InputBorder.none,
            hintText: hint),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../resources/dimen.dart';

class ReusableTextFormField extends StatelessWidget {
  TextEditingController controller;
  String hint;
  Icon? prefixIcon;
  bool isPassword;
  ReusableTextFormField(
      {Key? key, required this.controller, required this.hint,this.prefixIcon,required this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      height: TEXT_FIELD_HEIGHT,
      child: TextFormField(
        controller: controller,
        obscureText: isPassword? true:false,
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
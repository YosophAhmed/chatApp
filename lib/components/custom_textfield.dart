import 'package:chat/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String? hintText;

  const CustomTextField({Key? key, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor4,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor4,
          ),
        ),
        hintText: hintText,
      ),
    );
  }
}

import 'package:chat/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {

  final String? hintText;
  final IconData? suffix;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function()? sendMessage;

  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.suffix,
    this.sendMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (data) {
          if(data!.isEmpty){
            return 'field is required!';
          }
          return null;
      },
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor4,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor4,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor4,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: sendMessage,
          icon: Icon(suffix),
          color: primaryColor4,
        ),
      ),
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
    );
  }
}

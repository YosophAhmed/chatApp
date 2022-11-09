import 'package:chat/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatelessWidget {

  final String? hintText;
  final IconData? suffix;
  final IconData? prefix;
  final bool? obscure;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final void Function()? suffixFunction;

  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.obscure = false,
    this.controller,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.suffix,
    this.prefix,
    this.suffixFunction,
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
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: primaryColor4,
          ),
          borderRadius: BorderRadius.circular(16.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: primaryColor4,
          ),
          borderRadius: BorderRadius.circular(16.sp),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: primaryColor4,
          ),
          borderRadius: BorderRadius.circular(16.sp),
        ),
        prefixIcon: Icon(
          prefix,
          color: primaryColor4,
        ),
        suffixIcon: IconButton(
          onPressed: suffixFunction,
          icon: Icon(suffix),
          color: primaryColor4,
        ),
      ),
      keyboardType: keyboardType,
      obscureText: obscure!,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
    );
  }
}

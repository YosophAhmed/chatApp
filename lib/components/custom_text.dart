import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';

class CustomText extends StatelessWidget {

  final String text;

  const CustomText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: primaryColor4,
        fontFamily: 'Pacifico',
      ),
      textAlign: TextAlign.center,
    );
  }
}

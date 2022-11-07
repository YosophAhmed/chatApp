import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: double.infinity,
      child: Image.asset('assets/images/Chat.png'),
    );
  }
}

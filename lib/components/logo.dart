import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.sp),
        image: const DecorationImage(
          image: AssetImage('assets/images/Chat.png'),
        ),
      ),
    );
  }
}

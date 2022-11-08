import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          left: 3.w,
          top: 2.h,
          right: 6.w
        ),
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: primaryColor4,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.sp),
            topRight: Radius.circular(24.sp),
            bottomRight: Radius.circular(24.sp),
          ),
        ),
        child: Text(
          'Hello there i\'m a new user Hello there i\'m a new user Hello there i\'m a new user',
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}

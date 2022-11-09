import 'package:chat/models/message.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constants/colors.dart';

class ChatItem extends StatelessWidget {

  final Message message;

  const ChatItem({Key? key, required this.message}) : super(key: key);

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
          message.message,
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}

class ChatItemTwo extends StatelessWidget {

  final Message message;

  const ChatItemTwo({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.only(
            left: 3.w,
            top: 2.h,
            right: 6.w
        ),
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          color: primaryColor3,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.sp),
            topRight: Radius.circular(24.sp),
            bottomLeft: Radius.circular(24.sp),
          ),
        ),
        child: Text(
          message.message,
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}

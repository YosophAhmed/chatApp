import 'package:chat/components/chat_item.dart';
import 'package:chat/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../components/custom_textfield.dart';

class ChatPage extends StatelessWidget {
  static const String id = 'ChatPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor1,
      appBar: AppBar(
        title: Image.asset(
          'assets/images/Chat.png',
          height: 25.h,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => ChatItem(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: CustomTextFormField(
              onChanged: (message) {},
              suffix: Icons.send,
              sendMessage: (){},
              hintText: 'Send message',
            ),
          ),
        ],
      ),
    );
  }
}

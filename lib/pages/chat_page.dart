import 'package:chat/components/chat_item.dart';
import 'package:chat/constants/collections.dart';
import 'package:chat/constants/colors.dart';
import 'package:chat/models/message.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/custom_textfield.dart';

class ChatPage extends StatelessWidget {
  static const String id = 'ChatPage';
  TextEditingController controller = TextEditingController();

  CollectionReference messages =
      FirebaseFirestore.instance.collection(messagesCollection);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: messages.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
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
                    itemBuilder: (context, index) => ChatItem(
                      message: messagesList[index],
                    ),
                    itemCount: messagesList.length,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: CustomTextFormField(
                    controller: controller,
                    suffix: Icons.send,
                    sendMessage: () {},
                    hintText: 'Send message',
                    onSubmitted: (message) {
                      messages.add({
                        'message': message,
                      });
                      controller.clear();
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
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
                Expanded(child: Text('')),
                Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: CustomTextFormField(
                    controller: controller,
                    suffix: Icons.send,
                    sendMessage: () {},
                    hintText: 'Send message',
                    onSubmitted: (message) {
                      messages.add({
                        'message': message,
                      });
                      controller.clear();
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}

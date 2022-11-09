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
  final controller = TextEditingController();
  final scrollController = ScrollController();
  String? messageSubmit;

  CollectionReference messages =
      FirebaseFirestore.instance.collection(messagesCollection);

  ChatPage({super.key});

  @override
  Widget build(BuildContext context) {

    var email = ModalRoute.of(context)!.settings.arguments;

    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kmessageTime, descending: true).snapshots(),
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
                    reverse: true,
                    controller: scrollController,
                    itemBuilder: (context, index) {
                      return messagesList[index].id != email ? ChatItem(
                      message: messagesList[index],
                    ) : ChatItemTwo(
                        message: messagesList[index],
                      );
                    },
                    itemCount: messagesList.length,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: CustomTextFormField(
                    controller: controller,
                    keyboardType: TextInputType.text,
                    prefix: Icons.attach_file_rounded,
                    suffix: Icons.send,
                    hintText: 'Send message',
                    onSubmitted: (message) {
                      if(message.isNotEmpty) {
                        messageSubmit = message;
                      }
                    },
                    onChanged: (message){
                      messageSubmit = message;
                    },
                    suffixFunction: () {
                      messages.add({
                        kMessage: messageSubmit,
                        kmessageTime: DateTime.now(),
                        messageId : email,
                      });
                      controller.clear();
                      scrollController.jumpTo(0);
                    },
                  ),
                ),
              ],
            ),
          );
        }
        else {
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
                    child: ListView(),
                ),
                Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: CustomTextFormField(
                    controller: controller,
                    suffix: Icons.send,
                    suffixFunction: () {},
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

import 'package:chat/components/chat_item.dart';
import 'package:chat/constants/collections.dart';
import 'package:chat/constants/colors.dart';
import 'package:chat/models/message.dart';
import 'package:chat/pages/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat/pages/cubits/chat_cubit/chat_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../components/custom_textfield.dart';

class ChatPage extends StatelessWidget {
  static const String id = 'ChatPage';
  final controller = TextEditingController();
  final scrollController = ScrollController();
  String? messageSubmit;

  List<Message> messagesList = [];

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;

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
          BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              var messagesList = BlocProvider.of<ChatCubit>(context).messagesList;
              return Expanded(
              child: ListView.builder(
                reverse: true,
                controller: scrollController,
                itemBuilder: (context, index) {
                  return messagesList[index].id != email
                      ? ChatItem(
                          message: messagesList[index],
                        )
                      : ChatItemTwo(
                          message: messagesList[index],
                        );
                },
                itemCount: messagesList.length,
              ),
            );
            },
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
                if (message.isNotEmpty) {
                  messageSubmit = message;
                }
              },
              onChanged: (message) {
                messageSubmit = message;
              },
              suffixFunction: () {
                BlocProvider.of<ChatCubit>(context).sendMessage(
                  message: messageSubmit!,
                  email: id,
                );
                controller.clear();
                scrollController.jumpTo(0);
              },
            ),
          ),
        ],
      ),
    );
  }
}

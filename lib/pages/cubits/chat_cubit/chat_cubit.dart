import 'package:chat/pages/cubits/chat_cubit/chat_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/collections.dart';
import '../../../models/message.dart';

class ChatCubit extends Cubit<ChatState>{
  ChatCubit() : super(ChatInitial());

  CollectionReference messages =
  FirebaseFirestore.instance.collection(messagesCollection);

  List<Message> messagesList = [];

  void sendMessage({
    required String message,
    required String email,
  }) {
    messages.add({
      kMessage: message,
      kmessageTime: DateTime.now(),
      messageId: email,
    });
  }
  void getMessages() {
    messages.orderBy(kmessageTime, descending: true).snapshots().listen(
            (event) {
              messagesList.clear();
              for(var doc in event.docs){
                messagesList.add(Message.fromJson(doc));
              }
              emit(ChatSuccess(messages: messagesList));
            },
    );
  }

}
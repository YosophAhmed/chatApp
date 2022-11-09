import 'package:chat/constants/collections.dart';

class Message {
  final String message;
  final String id;
  Message(this.message, this.id);

  factory Message.fromJson(jsonData) => Message(
    jsonData[kMessage],
    jsonData[messageId],
  );

}
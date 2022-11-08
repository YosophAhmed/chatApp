import 'package:chat/constants/collections.dart';

class Message {
  final String message;

  Message(this.message);

  factory Message.fromJson(jsonData) => Message(jsonData[kMessage]);

}
import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (
      context,
      orientation,
      deviceType,
    ) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginPage.id,
        routes: {
          LoginPage.id: (context) => LoginPage(),
          RegisterPage.id : (context) => RegisterPage(),
        },
      );
    });
  }
}

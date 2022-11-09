import 'package:chat/pages/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../components/custom_button.dart';
import '../components/custom_text.dart';
import '../components/custom_textfield.dart';
import '../components/logo.dart';
import '../components/snakbar.dart';
import '../constants/colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  static const String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;
  String? password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  Future<void> register() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: primaryColor1,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const Logo(),
                const CustomText(text: 'Register now'),
                CustomTextFormField(
                  hintText: 'Enter valid email',
                  onChanged: (data) {
                    email = data;
                  },
                  prefix: Icons.email_rounded,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextFormField(
                  hintText: 'Enter strong password',
                  onChanged: (data) {
                    password = data;
                  },
                  prefix: Icons.lock,
                  keyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomButton(
                  label: 'REGISTER',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await register();
                        if (!mounted) return;
                        showSnackBar(context, 'Registration succeeded',);
                        Navigator.popAndPushNamed(
                          context,
                          ChatPage.id,
                          arguments: email,
                        );
                      } on FirebaseAuthException catch (error) {
                        if(error.code == 'weak-password') {
                          showSnackBar(context, 'The password provided is too weak.');
                        } else if(error.code == 'email-already-in-use') {
                          showSnackBar(context, 'The account already exists for that email.');
                        } else {
                          showSnackBar(context, 'Sorry, there was an error');
                        }
                      } catch(error) {
                        showSnackBar(context, 'Sorry, there was an error');
                      }
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You have an account ',
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login Now',
                        style: TextStyle(
                          color: primaryColor4,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

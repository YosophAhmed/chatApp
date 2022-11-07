import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../components/custom_button.dart';
import '../components/custom_text.dart';
import '../components/custom_textfield.dart';
import '../components/logo.dart';
import '../constants/colors.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  static const String id = 'RegisterPage';

  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor1,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              const Logo(),
              const CustomText(text: 'Register now'),
              CustomTextField(
                hintText: 'Enter valid email',
                onChanged: (data) {
                  email = data;
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomTextField(
                hintText: 'Enter strong password',
                onChanged: (data) {
                  password = data;
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomButton(
                label: 'REGISTER',
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    try {
                      await register();
                      showSnackBar(context, 'Registration succeeded');
                    } on FirebaseAuthException catch (error) {
                      if(error.code == 'weak-password') {
                        showSnackBar(context, 'The password provided is too weak.');
                      } else if(error.code == 'email-already-in-use') {
                        showSnackBar(context, 'The account already exists for that email.');
                      }
                    } catch(error) {
                      showSnackBar(context, 'Sorry, there was an error');
                    }
                  }
                  else {

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
    );
  }

  Future<void> register() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: primaryColor4,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
          ),
        ),
      ),
    );
  }
}

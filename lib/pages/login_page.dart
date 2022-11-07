import 'package:chat/components/custom_button.dart';
import 'package:chat/components/custom_text.dart';
import 'package:chat/components/custom_textfield.dart';
import 'package:chat/constants/colors.dart';
import 'package:chat/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../components/logo.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../components/snakbar.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'LoginPage';


  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();

  Future<void> login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
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
                const CustomText(text: 'Login now'),
                CustomTextFormField(
                  hintText: 'Enter your email',
                  onChanged: (data) {
                      email = data;
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomTextFormField(
                  hintText: 'Enter your password',
                  onChanged: (data) {
                    password = data;
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                CustomButton(
                  label: 'LOGIN',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await login();
                        showSnackBar(context, 'Login succeeded');
                      } on FirebaseAuthException catch (error) {
                        if(error.code == 'user-not-found') {
                          showSnackBar(context, 'No user found for that email.');
                        } else if(error.code == 'wrong-password') {
                          showSnackBar(context, 'Wrong password provided for that user.');
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
                      'Oh no! you don\'t even have an account ',
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RegisterPage.id,
                        );
                      },
                      child: Text(
                        'Register Now',
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

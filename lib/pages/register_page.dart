import 'package:chat/pages/chat_page.dart';
import 'package:chat/pages/cubits/auth_cubit/auth_cubit.dart';
import 'package:chat/pages/cubits/auth_cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../components/custom_button.dart';
import '../components/custom_text.dart';
import '../components/custom_textfield.dart';
import '../components/logo.dart';
import '../components/snakbar.dart';
import '../constants/colors.dart';


class RegisterPage extends StatelessWidget {
  static const String id = 'RegisterPage';
  String? email;
  String? password;
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(
      listener: (context, state) {
        if(state is RegisterLoading) {
          isLoading = true;
        } else if(state is RegisterSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context, ChatPage.id,
                  (route) => false,
          );
          isLoading = false;
        } else if(state is RegisterFailure) {
          showSnackBar(context, state.errorMessage);
          isLoading = false;
        }
      },
      builder: (context, state) => ModalProgressHUD(
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
                        BlocProvider.of<AuthCubit>(context).register(
                            email: email!,
                            password: password!,
                        );
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
      ),
    );
  }
}

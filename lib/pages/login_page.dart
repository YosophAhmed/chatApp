import 'package:chat/components/custom_button.dart';
import 'package:chat/components/custom_text.dart';
import 'package:chat/components/custom_textfield.dart';
import 'package:chat/constants/colors.dart';
import 'package:chat/pages/auth_bloc/auth_bloc.dart';
import 'package:chat/pages/auth_bloc/auth_event.dart';
import 'package:chat/pages/cubits/chat_cubit/chat_cubit.dart';
import 'package:chat/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../components/logo.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../components/snakbar.dart';
import 'auth_bloc/auth_state.dart';
import 'chat_page.dart';

class LoginPage extends StatelessWidget {
  static const String id = 'LoginPage';

  String? email;
  String? password;
  bool isLoading = false;
  bool isPressed = true;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatCubit>(context).getMessages();
          isLoading = false;
          Navigator.pushNamedAndRemoveUntil(
            context,
            ChatPage.id,
            arguments: email,
            (route) => false,
          );
        } else if (state is LoginFailure) {
          isLoading = false;
          showSnackBar(context, state.errorMessage);
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
                  const CustomText(text: 'Login now'),
                  CustomTextFormField(
                    hintText: 'Enter your email',
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
                    hintText: 'Enter your password',
                    onChanged: (data) {
                      password = data;
                    },
                    prefix: Icons.lock,
                    suffix: isPressed ? Icons.visibility_off : Icons.visibility,
                    suffixFunction: () {},
                    obscure: isPressed ? true : false,
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomButton(
                    label: 'LOGIN',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(
                          LoginEvent(email: email!, password: password!),
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
      ),
    );
  }
}

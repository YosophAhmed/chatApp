import 'package:chat/components/custom_button.dart';
import 'package:chat/components/custom_text.dart';
import 'package:chat/components/custom_textfield.dart';
import 'package:chat/constants/colors.dart';
import 'package:chat/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../components/logo.dart';

class LoginPage extends StatelessWidget {
  static const String id = 'LoginPage';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor1,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: ListView(
          children: [
            const Logo(),
            const CustomText(text: 'Login now'),
            CustomTextField(
              hintText: 'Enter your email',
              onChanged: (data) {

              },
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomTextField(
              hintText: 'Enter your password',
              onChanged: (data) {

              },
            ),
            SizedBox(
              height: 2.h,
            ),
            CustomButton(
              label: 'LOGIN',
              onTap: () {

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
    );
  }
}

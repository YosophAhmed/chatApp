import 'package:chat/components/custom_button.dart';
import 'package:chat/components/custom_textfield.dart';
import 'package:chat/constants/colors.dart';
import 'package:chat/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {

  static const String id = 'LoginPage';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0FF43),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: ListView(
          children: [
            SizedBox(
              height: 5.h,
            ),
            CircleAvatar(
              radius: 115.sp,
              backgroundColor: primaryColor4,
              child: CircleAvatar(
                radius: 110.sp,
                backgroundImage:
                    const AssetImage('assets/images/Chat App.png'),
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              'Login now',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: primaryColor4,
                fontFamily: 'Pacifico',
              ),
              textAlign: TextAlign.center,
            ),
            const CustomTextField(
              hintText: 'Enter your email',
            ),
            SizedBox(
              height: 2.h,
            ),
            const CustomTextField(
              hintText: 'Enter your password',
            ),
            SizedBox(
              height: 2.h,
            ),
            const CustomButton(
              label: 'LOGIN',
            ),
            SizedBox(
              height: 4.h,
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

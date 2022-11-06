import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../components/custom_button.dart';
import '../components/custom_textfield.dart';
import '../constants/colors.dart';

class RegisterPage extends StatelessWidget {

  static const String id = 'RegisterPage';

  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0FF43),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: ListView(
          children: [
            SizedBox(height: 5.h,),
            CircleAvatar(
              radius: 115.sp,
              backgroundColor: primaryColor4,
              child: CircleAvatar(
                radius: 110.sp,
                backgroundImage: const AssetImage('assets/images/Chat App.png'),
              ),
            ),
            SizedBox(height: 1.h,),
            Text(
              'Register now',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: primaryColor4,
                fontFamily: 'Pacifico',
              ),
              textAlign: TextAlign.center,
            ),
            const CustomTextField(
              hintText: 'Enter valid email',
            ),
            SizedBox(height: 2.h,),
            const CustomTextField(
              hintText: 'Enter strong password',
            ),
            SizedBox(height: 2.h,),
            const CustomButton(
              label: 'REGISTER',
            ),
            SizedBox(
              height: 4.h,
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
    );
  }
}

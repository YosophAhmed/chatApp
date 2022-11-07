import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../components/custom_button.dart';
import '../components/custom_text.dart';
import '../components/custom_textfield.dart';
import '../components/logo.dart';
import '../constants/colors.dart';

class RegisterPage extends StatelessWidget {

  static const String id = 'RegisterPage';

   String? email;
   String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor1,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: ListView(
          children: [
            const Logo(),
            const CustomText(text: 'Register now'),
            CustomTextField(
              hintText: 'Enter valid email',
              onChanged: (data){
                email = data;
              },
            ),
            SizedBox(
              height: 2.h,),
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
                var auth = FirebaseAuth.instance;
                UserCredential user = await auth.createUserWithEmailAndPassword(
                    email: email!,
                    password: password!,
                );
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
    );
  }
}

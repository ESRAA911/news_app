import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/contstants/api_colors.dart';
import 'package:news/features/auth/views/login_view.dart';
import 'package:news/features/auth/widgets/custom_text.dart';
import 'package:news/features/auth/widgets/email_text_field.dart';
import 'package:news/features/auth/widgets/password_text_field.dart';

import 'package:news/features/home/views/home_view.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey();

    return Scaffold(
      body: Form(
        key: formKey,
        child: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.only(top: 60.h)),

                Image.asset('assets/icon.jpg', width: 160.w, height: 100.h),

                Center(child: CustomText(text: 'Sign Up', isbold: true)),

                Gap(30.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: EmailTextField(
                    label: 'Username',
                    emailCotroller: usernameController,
                  ),
                ),

                Gap(15.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: EmailTextField(
                    label: 'Email',
                    emailCotroller: emailController,
                  ),
                ),
                Gap(15.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: PasswordTextField(
                    passwordController: passwordController,
                    label: 'Password',
                    page: 'signup',
                  ),
                ),

                Gap(20.h),

                GestureDetector(
                  onTap: () async {
                    try {
                      final credential = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeView(),
                        ),
                      );
                    } on FirebaseAuthException catch (e) {
                      String message = 'Signup failed';
                      if (e.code == 'weak-password') {
                        message = 'The password provided is too weak.';
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        message = 'The account already exists for that email.';
                        print('The account already exists for that email.');
                      }
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.scale,
                        title: 'Error',
                        desc: message,
                        btnOkOnPress: () {},
                        btnOkColor: Colors.red,
                      ).show();
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Container(
                    width: 300.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: kButtonsColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                Gap(20.h),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: kButtonsColor),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginView(),
                            ),
                          );
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: kButtonsColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

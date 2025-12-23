import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/contstants/api_colors.dart';
import 'package:news/features/auth/views/signup_view.dart';
import 'package:news/features/auth/widgets/custom_text.dart';
import 'package:news/features/auth/widgets/email_text_field.dart';
import 'package:news/features/auth/widgets/password_text_field.dart';
import 'package:news/features/home/views/home_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(padding: EdgeInsets.only(top: 60.h)),
                Image.asset('assets/icon.jpg', width: 160.w, height: 100.h),
                Center(child: CustomText(text: 'Login', isbold: true)),
                Gap(40.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: EmailTextField(
                    label: 'Email',
                    emailCotroller: emailController,
                  ),
                ),
                Gap(25.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: PasswordTextField(
                    passwordController: passwordController,
                    label: 'Password',
                    page: 'login',
                  ),
                ),
                Gap(40.h),

                GestureDetector(
                  onTap: () async {
                    if (!formKey.currentState!.validate()) return;
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeView()),
                      );
                    } on FirebaseAuthException catch (e) {
                      String message = 'Login failed';

                      if (e.code == 'user-not-found') {
                        message = 'Email not found';
                      } else if (e.code == 'wrong-password') {
                        message = 'Wrong password';
                      } else if (e.code == 'invalid-credential') {
                        message = 'Email or password is incorrect';
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
                    }
                  },

                  child: Container(
                    width: 300.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: kButtonsColor,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: kButtonsColor),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupView(),
                            ),
                          );
                        },
                        child: Text(
                          'Signup',
                          style: TextStyle(
                            color: kButtonsColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

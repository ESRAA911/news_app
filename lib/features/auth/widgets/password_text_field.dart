import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/contstants/api_colors.dart';

// ignore: must_be_immutable
class PasswordTextField extends StatefulWidget {
  TextEditingController passwordController = TextEditingController();
  String label;
  String page;
  PasswordTextField({
    required this.passwordController,
    required this.label,
    required this.page,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  String? ErrorText;
  bool isValidPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kButtonsColor,
      controller: widget.passwordController,
      validator: (value) => Passwordvaild(value ?? ''),
      // Passwordvaild(value ?? ''),
      onChanged: (value) {
        setState(() {
          widget.page == 'Login'
              ? value = ''
              : ErrorText = Passwordvaild(value);
        });
      },
      obscureText: !isValidPassword,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.sp,
        fontFamily: 'bold',
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          vertical: 10.0.h,
          horizontal: 9.0.w,
        ),
        border: const OutlineInputBorder(),
        labelText: widget.label,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kButtonsColor),
          borderRadius: BorderRadius.all(Radius.circular(16.r)),
        ),
        suffixIcon: IconButton(
          icon: isValidPassword
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
          onPressed: () {
            setState(() {
              isValidPassword = !isValidPassword;
            });
          },
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kButtonsColor, width: 2.w),
          borderRadius: BorderRadius.all(Radius.circular(16)).w,
        ),
        errorText: ErrorText,
        floatingLabelStyle: const TextStyle(color: kButtonsColor),
      ),
    );
  }
}

String? Passwordvaild(String Value) {
  if (Value.isEmpty) {
    return 'Please enter your password ';
  }
  return null;
}

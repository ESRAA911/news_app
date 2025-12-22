import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/contstants/api_colors.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({
    super.key,
    required this.label,
    required this.emailCotroller,
  });
  final TextEditingController emailCotroller;
  final String label;
  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        selectionHeightStyle: BoxHeightStyle.tight,
        controller: widget.emailCotroller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email is required';
          }
          return null;
        },
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.sp,
          fontFamily: 'bold',
        ),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: widget.label,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kButtonsColor),
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kButtonsColor, width: 2.w),
            borderRadius: BorderRadius.all(Radius.circular(16)).w,
          ),
          floatingLabelStyle: const TextStyle(color: kButtonsColor),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/contstants/api_colors.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final bool isbold;
  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    required this.isbold,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: kButtonsColor,
        fontSize: fontSize ?? 30.sp,
        fontWeight: isbold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}

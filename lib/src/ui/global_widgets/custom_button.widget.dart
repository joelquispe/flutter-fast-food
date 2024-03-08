import 'package:ecommercesmall/src/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final double? height;
  final double? fontSize;
  final Color? backgroundColor;
  const CustomButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.height,
    this.fontSize,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? primaryColor,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: height ?? 50,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: white,
                fontWeight: FontWeight.w500,
                fontSize: fontSize ?? 16.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

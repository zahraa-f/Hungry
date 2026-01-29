import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/sheard/custom_text.dart';

class CustomeAuthButton extends StatelessWidget {
  const CustomeAuthButton({
    super.key,
    this.onTap,
    required this.text,
    this.color,
    this.textColor,
  });
  final Function()? onTap;
  final String text;
  final Color? color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: color ?? Colors.white,
          border: Border.all(color: Colors.white),
        ),
        width: double.infinity, //يعني ياخذ عرض الشاشة كلها
        child: Center(
          child: CustomText(
            text: text,
            size: 15,
            weight: FontWeight.w500,
            color: textColor ?? AppColors.primary,
          ),
        ),
      ),
    );
  }
}

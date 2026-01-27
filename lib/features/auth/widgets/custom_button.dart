import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/sheard/custom_text.dart';

class CustomeAuthButton extends StatelessWidget {
  const CustomeAuthButton({super.key, this.onTap, required this.text});
  final Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.white,
        ),
        width: double.infinity, //يعني ياخذ عرض الشاشة كلها
        child: Center(
          child: CustomText(
            text: text,
            size: 15,
            weight: FontWeight.w500,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}

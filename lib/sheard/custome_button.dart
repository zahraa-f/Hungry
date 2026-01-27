import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/sheard/custom_text.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton({super.key, required this.text, required this.onTap});
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: AppColors.primary,
        ),
        child: CustomText(
          text: text,
          color: Colors.white,
          weight: FontWeight.bold,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/sheard/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.color,
    this.height,
  });
  final String text;
  final Function()? onTap;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color ?? AppColors.primary,
        ),
        child: Center(
          child: CustomText(
            text: text,
            color: Colors.white,
            weight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

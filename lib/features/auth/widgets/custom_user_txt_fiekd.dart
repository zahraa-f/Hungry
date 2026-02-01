import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';

class CustomUserTxtFiekd extends StatelessWidget {
  const CustomUserTxtFiekd({
    super.key,
    required this.label,
    required this.controller,
  });
  final TextEditingController controller;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.primary,
      cursorHeight: 20,
      style: TextStyle(color: AppColors.primary),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: AppColors.primary),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

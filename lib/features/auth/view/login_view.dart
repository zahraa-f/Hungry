import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/widgets/custom_button.dart';
import 'package:hungry/sheard/custom_text.dart';
import 'package:hungry/sheard/custom_textfield.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(
          context,
        ).unfocus(); //عند الضغط على اي مكان بالواجهة خارج التيكست فيلد تلغي الفوكس من التيكست فيلد
      },
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Gap(100),
                  SvgPicture.asset('assets/logo/logo.svg'),
                  Gap(10),
                  CustomText(
                    text: 'Welcome Back, Discover The Fast Food',
                    color: Colors.white,
                    size: 13,
                    weight: FontWeight.w600,
                  ),
                  Gap(60),
                  CustomTextfield(
                    hint: 'Email Address',
                    isPassword: false,
                    controller: emailController,
                  ),
                  Gap(20),
                  CustomTextfield(
                    hint: 'Password',
                    isPassword: true,
                    controller: passwordController,
                  ),
                  Gap(30),
                  CustomeAuthButton(
                    text: 'Login',
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        print("login");
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

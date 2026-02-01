import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/view/singup_view.dart';
import 'package:hungry/features/auth/widgets/custom_button.dart';
import 'package:hungry/features/home/view/home_view.dart';
import 'package:hungry/root.dart';
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
        body: Form(
          key: formkey,
          child: Column(
            children: [
              Gap(200),
              SvgPicture.asset('assets/logo/logo.svg'),
              Gap(10),
              CustomText(
                text: 'Welcome Back, Discover The Fast Food',
                color: Colors.white60,
                size: 13,
                weight: FontWeight.w500,
              ),
              Gap(100),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
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
                          color: AppColors.primary,
                          textColor: Colors.white,
                          text: 'Login',
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              print("login");
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (c) => Root()),
                              );
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: 'Do you have account?',
                              color: AppColors.primary,
                              size: 15,
                              weight: FontWeight.w500,
                            ),
                            TextButton(
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(builder: (c) => SingupView()),
                              ),
                              child: Text(
                                'SingUp',
                                style: TextStyle(color: AppColors.primary),
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (c) => Root()),
                          ),
                          child: Text(
                            'Continue as a guest ?',
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

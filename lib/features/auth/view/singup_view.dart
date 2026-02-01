import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/view/login_view.dart';
import 'package:hungry/features/auth/widgets/custom_button.dart';
import 'package:hungry/sheard/custom_text.dart';
import 'package:hungry/sheard/custom_textfield.dart';

class SingupView extends StatelessWidget {
  const SingupView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
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
              SvgPicture.asset('assets/logo/logo.svg', color: Colors.white),
              CustomText(
                text: 'Welcome in our Food App',
                weight: FontWeight.w500,
                size: 13,
                color: Colors.white60,
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
                          hint: 'Name',
                          isPassword: false,
                          controller: nameController,
                        ),
                        Gap(20),
                        CustomTextfield(
                          hint: 'Email Address',
                          isPassword: false,
                          controller: emailController,
                        ),
                        Gap(20),
                        CustomTextfield(
                          hint: 'Password',
                          isPassword: true,
                          controller: passController,
                        ),
                        Gap(30),
                        CustomeAuthButton(
                          color: AppColors.primary,
                          textColor: Colors.white,
                          text: 'SingUp',
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              print("singup");
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
                                MaterialPageRoute(builder: (c) => LoginView()),
                              ),
                              child: Text(
                                'Login',
                                style: TextStyle(color: AppColors.primary),
                              ),
                            ),
                          ],
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

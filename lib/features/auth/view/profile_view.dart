import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/widgets/custom_user_txt_fiekd.dart';
import 'package:hungry/sheard/custom_text.dart';
import 'package:hungry/sheard/custome_button.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    _nameController.text = 'zahraa';
    _emailController.text = 'zahraa.ali@gmail.com';
    _addressController.text = 'Baghdad, Iraq';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-photo-183042379.jpg',
                    ),
                  ),
                  border: Border.all(width: 5, color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade300,
                ),
              ),
            ),
            Gap(30),
            CustomUserTxtFiekd(label: 'Name', controller: _nameController),
            Gap(15),
            CustomUserTxtFiekd(label: 'Email', controller: _emailController),
            Gap(20),
            CustomUserTxtFiekd(
              label: 'Address',
              controller: _addressController,
            ),
            Gap(10),
            Divider(),
            Gap(10),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
              tileColor: Colors.grey.shade900,
              leading: SvgPicture.asset(
                'assets/svg/visa.svg',
                width: 60,
                color: Colors.blue.shade700,
              ),
              title: CustomText(text: 'Debit card', color: Colors.white),
              subtitle: CustomText(text: '**** **** 2415', color: Colors.white),
              trailing: CustomText(text: 'Defualt', color: Colors.white),
            ),
            Gap(30),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(width: 3, color: Colors.grey.shade900),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Edit Profile',
                        color: Colors.white,
                        weight: FontWeight.w500,
                      ),
                      Icon(CupertinoIcons.pencil, color: Colors.white),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(width: 3, color: Colors.grey.shade900),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'Logout',
                        color: Colors.grey.shade900,
                        weight: FontWeight.w500,
                      ),
                      Icon(Icons.logout, color: Colors.grey.shade900),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

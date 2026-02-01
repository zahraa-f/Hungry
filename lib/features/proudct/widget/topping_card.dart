import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/sheard/custom_text.dart';

class ToppingCard extends StatelessWidget {
  const ToppingCard({
    super.key,
    required this.image,
    required this.title,
    required this.onAdd,
  });
  final String image;
  final String title;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(15),
          child: Container(
            height: 70,
            width: 105,
            // color: Color(0xff3C2F2F),
            color: AppColors.primary,
          ),
        ),

        Positioned(
          top: -40,
          right: -1,
          left: -1,
          child: SizedBox(
            height: 70,
            // width: 50,
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  image,
                  // fit: BoxFit.cover,
                  height: 15,
                  width: 15,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: 10,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: title,
                  color: Colors.white,
                  weight: FontWeight.bold,
                  size: 15,
                ),
                GestureDetector(
                  onTap: onAdd,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Icon(
                      CupertinoIcons.add,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          child: Container(height: 100, width: 120, color: Color(0xff3C2F2F)),
        ),

        Positioned(
          top: -40,
          right: -4,
          left: -4,
          child: SizedBox(
            height: 105,
            width: 70,
            child: Card(
              color: Colors.white,
              child: Image.asset(image, fit: BoxFit.cover),
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

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/sheard/custom_text.dart';
import 'package:hungry/sheard/custome_button.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 120, top: 10),
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/test/order.png', width: 100),
                        Gap(15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Humburger',
                              weight: FontWeight.w900,
                              size: 16,
                            ),
                            CustomText(
                              text: 'Qty: X3',
                              weight: FontWeight.bold,
                            ),
                            CustomText(
                              text: 'Price: 20\$',
                              weight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gap(20),
                    CustomButton(
                      text: 'Order Again',
                      color: Colors.grey.shade400,
                      onTap: () {},
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

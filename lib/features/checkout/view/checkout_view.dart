import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/checkout/widget/order_details_widget.dart';
import 'package:hungry/sheard/custom_text.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
   String selectedMethod = "Cash";
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Order summary',
              size: 20,
              weight: FontWeight.w500,
            ),
            Gap(10),
            OrderDetailsWidget(
              order: '20.5',
              taxes: '3.4',
              fees: '2.4',
              total: '26.3',
            ),
            Gap(80),
            CustomText(
              text: 'Payment methods',
              size: 20,
              weight: FontWeight.w500,
            ),
            Gap(15),

            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              tileColor: Color(0xff3C2F2F),
              leading: CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(CupertinoIcons.money_dollar, color: Colors.white),
              ),
              title: CustomText(text: 'Cash on Delivery', color: Colors.white),
              trailing: Radio<String>(
                activeColor: Colors.white,
                value: 'Cash',
                groupValue: selectedMethod,
                onChanged: (v) {},
              ),
            ),
            Gap(10),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
              tileColor: Colors.blue.shade900,
              leading: CircleAvatar(
                backgroundColor: AppColors.primary,
                child: Icon(CupertinoIcons.cart, color: Colors.white),
              ),
              title: CustomText(text: 'Debit card', color: Colors.white),
              subtitle: CustomText(text: '**** **** 2415', color: Colors.white),
              trailing: Radio<String>(
                activeColor: Colors.white,
                value: 'Visa',
                groupValue: selectedMethod,
                onChanged: (v) {setState(() {
                  selectedMethod = v!;
                });},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

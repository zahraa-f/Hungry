import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/checkout/widget/order_details_widget.dart';
import 'package:hungry/sheard/custom_text.dart';
import 'package:hungry/sheard/custome_button.dart';

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
        child: SingleChildScrollView(
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
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                tileColor: Color(0xff3C2F2F),
                leading: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  child: Icon(CupertinoIcons.money_dollar, color: Colors.white),
                ),
                title: CustomText(
                  text: 'Cash on Delivery',
                  color: Colors.white,
                ),
                trailing: Radio<String>(
                  activeColor: Colors.white,
                  value: 'Cash',
                  groupValue: selectedMethod,
                  onChanged: (v) => setState(() => selectedMethod = v!),
                ),
                onTap: () => setState(() => selectedMethod = 'Cash'),
              ),
              Gap(10),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 16,
                ),
                tileColor: Colors.blue.shade900,
                leading: SvgPicture.asset(
                  'assets/svg/visa.svg',
                  width: 60,
                  color: Colors.white,
                ),
                title: CustomText(text: 'Debit card', color: Colors.white),
                subtitle: CustomText(
                  text: '**** **** 2415',
                  color: Colors.white,
                ),
                trailing: Radio<String>(
                  activeColor: Colors.white,
                  value: 'Visa',
                  groupValue: selectedMethod,
                  onChanged: (v) => setState(() => selectedMethod = v!),
                ),
                onTap: () => setState(() => selectedMethod = 'Visa'),
              ),
              Gap(5),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (v) {},
                    activeColor: Color(0xffEF2A39),
                  ),
                  CustomText(
                    text: 'save card details for future payments',
                    color: Colors.grey.shade800,
                  ),
                ],
              ),
              Gap(200),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 10, offset: Offset(0, 1)),
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        height: 120,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Total price',
                    weight: FontWeight.bold,
                    size: 16,
                  ),
                  CustomText(text: '\$18.9', weight: FontWeight.bold, size: 24),
                ],
              ),

              CustomButton(
                text: 'Pay Now',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 200,
                          ),
                          child: Container(
                            width: 300,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.check_mark_circled_solid,
                                  color: AppColors.primary,
                                  size: 65,
                                ),
                                Gap(10),
                                CustomText(
                                  text: 'Success!',
                                  color: AppColors.primary,
                                  weight: FontWeight.bold,
                                  size: 20,
                                ),
                                Gap(8),
                                CustomText(
                                  text:
                                      'Your payment was successful. \nA receipt for this purchase \nhas been sent your email ',
                                  color: Colors.grey.shade600,
                                  size: 11,
                                ),
                                Gap(10),
                                CustomButton(
                                  text: 'close',
                                  onTap: () => Navigator.pop(context),
                                  width: 200,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

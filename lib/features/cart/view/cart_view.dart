import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/cart/widget/cart_item.dart';
import 'package:hungry/sheard/custom_text.dart';
import 'package:hungry/sheard/custome_button.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  int number = 1;
  void onAdd() {
    setState(() {
      number++;
    });
  }

  void onMin() {
    setState(() {
      if (number > 1) {
        number--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 120, top: 50),
          itemCount: 6,
          itemBuilder: (context, index) {
            return CartItem(
              image: 'assets/test/order.png',
              text: 'Humburger',
              desc: 'Veggie Burger',
              number: number,
              onAdd: onAdd,
              onMin: onMin,
            );
          },
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 75,
        width: double.infinity,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: 'Total', weight: FontWeight.bold, size: 16),
                CustomText(text: '\$18.9', weight: FontWeight.bold, size: 24),
              ],
            ),
            Spacer(),
            CustomeButton(text: 'Checkout', onTap: () {}),
          ],
        ),
      ),
    );
  }
}

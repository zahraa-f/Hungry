import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/cart/widget/cart_item.dart';
import 'package:hungry/features/checkout/view/checkout_view.dart';
import 'package:hungry/sheard/custom_text.dart';
import 'package:hungry/sheard/custome_button.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late List<int> quantities;
  final int itemCount = 20;
  @override
  void initState() {
    quantities = List.generate(itemCount, (_) => 1);
    super.initState();
  }

  void onAdd(int index) {
    setState(() {
      quantities[index]++;
    });
  }

  void onMin(int index) {
    setState(() {
      if (quantities[index] > 1) {
        quantities[index]--;
      }
    });
  }

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
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return CartItem(
              image: 'assets/test/order.png',
              text: 'Humburger',
              desc: 'Veggie Burger',
              number: quantities[index],
              onAdd: () => onAdd(index),

              onMin: () => onMin(index),
            );
          },
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        height: 75,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
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
            CustomButton(
              text: 'Checkout',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return CheckoutView();
                    },
                  ),
                );
              },
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

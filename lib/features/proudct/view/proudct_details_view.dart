import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/proudct/widget/spicy_slider.dart';
import 'package:hungry/features/proudct/widget/topping_card.dart';
import 'package:hungry/sheard/custom_text.dart';
import 'package:hungry/sheard/custome_button.dart';

class ProudctDetailsView extends StatefulWidget {
  const ProudctDetailsView({super.key});

  @override
  State<ProudctDetailsView> createState() => _ProudctDetailsViewState();
}

class _ProudctDetailsViewState extends State<ProudctDetailsView> {
  double value = 0.5;
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
              SpicySlider(
                value: value,
                onChanged: (v) {
                  setState(() => value = v);
                  print(value);
                },
              ),
              Gap(20),
              CustomText(text: 'Toppings', weight: FontWeight.bold, size: 20),
              Gap(50),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(4, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ToppingCard(
                        image: 'assets/detail/tomato.png',
                        title: 'Tomato',
                        onAdd: () {},
                      ),
                    );
                  }),
                ),
              ),
              Gap(20),
              CustomText(
                text: 'Side options',
                weight: FontWeight.bold,
                size: 20,
              ),
              Gap(50),
              SingleChildScrollView(
                clipBehavior: Clip.none,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(4, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ToppingCard(
                        image: 'assets/detail/fries.png',
                        title: 'Fries',
                        onAdd: () {},
                      ),
                    );
                  }),
                ),
              ),
              Gap(50),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Total',
                        weight: FontWeight.bold,
                        size: 16,
                      ),
                      CustomText(
                        text: '\$18.9',
                        weight: FontWeight.bold,
                        size: 24,
                      ),
                    ],
                  ),
                  Spacer(),
                  CustomeButton(text: 'Add To Cart', onTap: () {}),
                ],
              ),
              Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/home/widget/card_item.dart';
import 'package:hungry/features/home/widget/food_category.dart';
import 'package:hungry/features/home/widget/search_field.dart';
import 'package:hungry/features/home/widget/user_header.dart';
import 'package:hungry/features/proudct/view/proudct_details_view.dart';
import 'package:hungry/sheard/custom_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List category = ['All', 'Combos', 'Sliders', 'Classic'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // Appbar
            SliverAppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              pinned: true,
              floating: false,
              backgroundColor: Colors.white,
              toolbarHeight: 190,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(top: 35, right: 15, left: 15),
                child: Column(children: [UserHeader(), Gap(20), SearchField()]),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 5,
                ),
                child: FoodCategory(
                  category: category,
                  selectedIndex: selectedIndex,
                ),
              ),
            ),

            // Grid View
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                  mainAxisSpacing: 10,
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: 6,
                  (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (c) {
                            return ProudctDetailsView();
                          },
                        ),
                      );
                    },
                    child: CardItem(
                      image: 'assets/test/test.png',
                      text: 'Cheeseburger',
                      desc: 'Wendy"s Burger',
                      rate: '4.9',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

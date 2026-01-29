import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/sheard/custom_text.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({
    super.key,
    required this.order,
    required this.taxes,
    required this.fees,
    required this.total,
  });
  final String order, taxes, fees, total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        checkoutWidget('order', order, false, false),
        Gap(10),
        checkoutWidget('Taxes', taxes, false, false),
        Gap(10),
        checkoutWidget('Delivery fees', fees, false, false),
        Divider(),
        checkoutWidget('Total', total, true, false),
        Gap(10),
        checkoutWidget('Estimated delivery time', '15 - 30 mint', true, true),
      ],
    );
  }
}

Widget checkoutWidget(String title, String price, bool isBold, bool isSmall) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
        text: title,
        size: isSmall ? 14 : 16,
        weight: isBold ? FontWeight.bold : FontWeight.w400,
        color: isBold ? Colors.black : Colors.grey.shade800,
      ),
      CustomText(
        text: '$price \$',
        size: isSmall ? 14 : 16,
        weight: isBold ? FontWeight.bold : FontWeight.w400,
        color: isBold ? Colors.black : Colors.grey.shade800,
      ),
    ],
  );
}

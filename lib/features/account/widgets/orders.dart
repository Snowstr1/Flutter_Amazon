import 'package:amazon_new/constants/global_variables.dart';
import 'package:amazon_new/features/account/widgets/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<String> list = [
    'https://plus.unsplash.com/premium_photo-1750317246680-8e0c19023ec5?w=600&auto=format&fit=crop&q=60',
    'https://plus.unsplash.com/premium_photo-1750317246680-8e0c19023ec5?w=600&auto=format&fit=crop&q=60',
    'https://plus.unsplash.com/premium_photo-1750317246680-8e0c19023ec5?w=600&auto=format&fit=crop&q=60',
    'https://plus.unsplash.com/premium_photo-1750317246680-8e0c19023ec5?w=600&auto=format&fit=crop&q=60',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: const Text(
                'Your Orders',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),

            Container(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                'See All',
                style: TextStyle(color: GlobalVariables.selectedNavBarColor),
              ),
            ),
          ],
        ),

        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return SingleProduct(image: list[index]);
            },
          ),
        ),
      ],
    );
  }
}

import 'package:amazon_new/common/widgets/stars.dart';
import 'package:amazon_new/models/product.dart';
import 'package:flutter/material.dart';

class SearchedProduct extends StatelessWidget {
  final Product product;
  const SearchedProduct({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Image.network(
                product.images[0],
                fit: BoxFit.fitHeight,
                height: 135,
                width: 135,
              ),
              Column(
                children: [
                  Container(
                    width: 235,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      product.name,
                      style: const TextStyle(fontSize: 16),
                      maxLines: 2,
                    ),
                  ),

                  Container(
                    width: 235,
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: const Stars(rating: 4),
                  ),

                  Container(
                    width: 235,
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      '\$${product.price}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: EdgeInsets.only(left: 10),
                    child: const Text('Eligible For Free Shipping'),
                  ),
                  Container(
                    width: 235,
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: const Text(
                      'In Stock',
                      style: const TextStyle(color: Colors.teal),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

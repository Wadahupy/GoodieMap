import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:goodiemap_app/models/product_model.dart';
import 'package:goodiemap_app/widgets/product_card.dart';

class ProductCarousel extends StatelessWidget {
  final List<Product> products;

  const ProductCarousel({
    Key? key,
    required this.products,
  }) : super(key: key);

  // Product carousel listview builder
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
        },
      ),
      child: SizedBox(
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(
              product: products[index],
            );
          },
        ),
      ),
    );
  }
}

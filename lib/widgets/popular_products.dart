import 'package:flutter/material.dart';
import 'package:goodiemap_app/models/product_model.dart';
import 'package:goodiemap_app/widgets/widgets.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Popular Products',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF46B177),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the ProductGrid screen with popular products
                    Navigator.push(
                      context,
                      ProductGrid(
                        products: Product.products
                            .where((product) => product.isPopular)
                            .toList(),
                        title: 'POPULAR PRODUCTS', // Pass the appropriate title
                      ).route(),
                    );
                  },
                  child: const Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Product Carousel
          ProductCarousel(
            products:
                Product.products.where((product) => product.isPopular).toList(),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recommended Products',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF46B177),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigate to the ProductGrid screen with recommended products
                    Navigator.push(
                      context,
                      ProductGrid(
                        products: Product.products
                            .where((product) => product.isRecommended)
                            .toList(),
                        title:
                            'RECOMMENDED PRODUCTS', // Pass the appropriate title
                      ).route(),
                    );
                  },
                  child: const Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ProductCarousel(
            products: Product.products
                .where((product) => product.isRecommended)
                .toList(),
          ),
        ],
      ),
    );
  }
}

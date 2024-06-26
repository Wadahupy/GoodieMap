import 'package:flutter/material.dart';
import 'package:goodiemap_app/models/product_model.dart';
import 'package:goodiemap_app/provider/theme_provider.dart';
import 'package:goodiemap_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class PopularProduct extends StatelessWidget {
  const PopularProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      color: Theme.of(context).colorScheme.surface,
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
                        title: 'POPULAR PRODUCTS',
                      ).route(),
                    );
                  },
                  child: Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: themeProvider.isDarkMode
                          ? Colors.white // Set the text color for dark mode
                          : Colors
                              .black54, // Set the text color for light mode,
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
                        title: 'RECOMMENDED PRODUCTS',
                      ).route(),
                    );
                  },
                  child: Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: themeProvider.isDarkMode
                          ? Colors.white // Set the text color for dark mode
                          : Colors
                              .black54, // Set the text color for light mode,,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Select product is recommended
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

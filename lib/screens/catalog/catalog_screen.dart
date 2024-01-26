import 'package:flutter/material.dart';
import 'package:goodiemap_app/widgets/product_card.dart';

import '../../models/models.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required Category category}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  final Category category;
  const CatalogScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF46B177), size: 50),
        title: Text(
          category.section,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Color(0xFF46B177),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Add the text above the GridView
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              category.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF46B177),
              ),
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemCount: categoryProducts.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(
                  product: categoryProducts[index],
                  widthFactor: 2,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

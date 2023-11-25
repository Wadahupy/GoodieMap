import 'package:flutter/material.dart';
import 'package:goodiemap_app/models/product_model.dart';
import 'package:goodiemap_app/widgets/product_card.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products;
  final String title;

  static const String routeName = '/SeeAll';

  const ProductGrid({
    Key? key,
    required this.products,
    required this.title, // Added title parameter
  }) : super(key: key);

  Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF46B177), size: 50),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF46B177),
          ),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemCount:
            products.length, // Use the length of the provided products list
        itemBuilder: (BuildContext context, int index) {
          return ProductCard(
            product: products[index], // Use the provided products list
            widthFactor: 2,
          );
        },
      ),
    );
  }
}

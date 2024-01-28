import 'package:flutter/material.dart';
import 'package:goodiemap_app/models/models.dart';
import 'package:goodiemap_app/widgets/category_card.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});
  static const String routeName = '/map';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const MapScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gridview builder for category section
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: 2.2),
          itemCount: Category.categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: CategoryCard(
                category: Category.categories[index],
                widthFactor: 1.1,
              ),
            );
          },
        ),
      ),
    );
  }
}

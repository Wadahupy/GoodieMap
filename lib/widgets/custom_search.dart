import 'package:flutter/material.dart';
import 'package:goodiemap_app/screens/search/search_screen.dart';

import '../models/product_model.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    "Eden",
    "Cheese",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Product> matchingProducts = [];
    for (var product in Product.products) {
      if (product.name.toLowerCase().contains(query.toLowerCase())) {
        matchingProducts.add(product);
      }
    }

    // Use Future.delayed to postpone the navigation until the build phase is complete
    Future.delayed(Duration.zero, () {
      // Navigate to the search results screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              SearchResultsScreen(searchResults: matchingProducts),
        ),
      );
    });

    // Return an empty container, as the UI is built in SearchResultsScreen
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var product in searchTerms) {
      if (product.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(product);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}

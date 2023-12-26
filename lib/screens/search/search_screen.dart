// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:goodiemap_app/widgets/custom_search.dart';
import 'package:goodiemap_app/widgets/product_card.dart';
import '../../models/product_model.dart';

class SearchResultsScreen extends StatefulWidget {
  final List<Product> searchResults;

  const SearchResultsScreen({Key? key, required this.searchResults})
      : super(key: key);

  @override
  _SearchResultsScreenState createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  List<Product> _filteredResults = [];

  @override
  void initState() {
    super.initState();
    // Initialize with the original search results
    _filteredResults = List.from(widget.searchResults);
  }

  void _filterResults(bool highToLow) {
    setState(() {
      _filteredResults.sort((a, b) {
        // Compare prices and sort accordingly
        if (highToLow) {
          return b.price.compareTo(a.price);
        } else {
          return a.price.compareTo(b.price);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle the back button behavior
        Navigator.popUntil(context, ModalRoute.withName('/'));
        return false; // Prevent default back button behavior
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 70,
          title: const Text("GoodieMap"),
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(),
                    );
                  },
                  icon: const Icon(Icons.search),
                ),
                PopupMenuButton(
                  onSelected: (value) {
                    // Handle the selected filter option
                    if (value == 'highToLow') {
                      _filterResults(true);
                    } else if (value == 'lowToHigh') {
                      _filterResults(false);
                    }
                  },
                  itemBuilder: (BuildContext context) => [
                    const PopupMenuItem(
                      value: 'highToLow',
                      child: Text('Price: High to Low'),
                    ),
                    const PopupMenuItem(
                      value: 'lowToHigh',
                      child: Text('Price: Low to High'),
                    ),
                  ],
                  icon: const Icon(Icons.filter_alt_outlined),
                ),
              ],
            )
          ],
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(26),
              ),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 95, 190, 138),
                  Color.fromARGB(255, 19, 207, 182),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: _filteredResults.length,
          itemBuilder: (context, index) {
            return ProductCard(product: _filteredResults[index]);
          },
        ),
      ),
    );
  }
}

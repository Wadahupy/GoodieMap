// ignore_for_file: camel_case_types, use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goodiemap_app/bloc/cart/cart_bloc.dart';
import 'package:goodiemap_app/bloc/cart/favorite/bloc/favorite_bloc.dart';
import 'package:goodiemap_app/models/models.dart';
import 'package:goodiemap_app/models/product_model.dart';
import 'package:goodiemap_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class productScreen extends StatefulWidget {
  static const String routeName = '/product';

  static Route route({required Product product}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => productScreen(product: product),
    );
  }

  final Product product;
  final bool isFavorite;

  const productScreen({
    Key? key,
    required this.product,
    this.isFavorite = false,
  }) : super(key: key);

  @override
  State<productScreen> createState() => _productScreenState();
}

class _productScreenState extends State<productScreen> {
  int quantitySelected = 1;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF46B177), size: 50),
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.symmetric(horizontal: 300)),
          Image.network(
            widget.product.imgUrl,
            height: 200,
            width: 300,
          ),
          Container(
            padding: const EdgeInsets.all(5),
            width: 380,
            height: 389,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    widget.product.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        '₱ ${widget.product.price}',
                        style: TextStyle(
                          fontSize: 24,
                          color: themeProvider.isDarkMode
                              ? Colors
                                  .greenAccent // Set the text color for dark mode
                              : const Color(
                                  0xFF46B177), // Set the text color for light mode,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              widget.product.description,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              // ... rest of the quantity code
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Center(
                              child: Text(
                                'LOCATION',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Image.network(
                              widget.product.location,
                              height: 160,
                              width: 200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  context
                      .read<CartBloc>()
                      .add(CartProductAdded(widget.product));
                  Navigator.pushNamed(context, '/cart');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF46B177),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 0.0,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 250,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(right: 10),
                            child: const Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            )),
                        const Text(
                          'ADD TO CART',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 322,
                height: 60,
                child: TextButton(
                  onPressed: () {
                    context
                        .read<FavoriteBloc>()
                        .add(AddFavoriteProduct(widget.product));

                    // Show custom SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              height: 90,
                              decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Row(
                                children: [
                                  SizedBox(width: 48),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Successfully Added to Favorites!',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Check your favorites to see the product',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 30,
                              left: 10,
                              child: SvgPicture.asset(
                                "assets/favorite.svg",
                                height: 48,
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.fixed, // Set to fixed
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                        side: const BorderSide(
                            color: Color(0xFF46B177), width: 3.0),
                      ),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Color(0xFF46B177),
                      ),
                      Text(
                        'ADD TO FAVORITE',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF46B177),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

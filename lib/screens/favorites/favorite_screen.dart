import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodiemap_app/bloc/cart/favorite/bloc/favorite_bloc.dart';
import 'package:goodiemap_app/widgets/widgets.dart';
import 'package:goodiemap_app/widgets/product_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FavoriteLoaded) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 100.0),
                  child: Text(
                    'MY FAVORITES',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 97, 133, 113),
                    ),
                  ),
                ),
                // Favorite product Gridview builder
                Expanded(
                  child: GridView.builder(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5,
                    ),
                    itemCount: state.favorite.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(
                        product: state.favorite.products[index],
                        widthFactor: 2,
                        isFavorite: true,
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}

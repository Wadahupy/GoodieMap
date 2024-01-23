// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:goodiemap_app/models/favorite_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../models/models.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteLoading()) {
    // Load favorites from local storage when the app starts
    _loadFavorites();

    on<StartFavorite>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const FavoriteLoaded());
    });

    on<AddFavoriteProduct>(
      (event, emit) async {
        if (state is FavoriteLoaded) {
          final state = this.state as FavoriteLoaded;

          // Check if the product is not already in the favorites
          if (!state.favorite.products.contains(event.product)) {
            final updatedFavorite = Favorite(
              products: List<Product>.from(state.favorite.products)
                ..add(event.product),
            );

            emit(FavoriteLoaded(favorite: updatedFavorite));

            // Save updated favorites to local storage
            await _saveFavorites(updatedFavorite);
          }
        }
      },
    );

    on<RemoveFavoriteProduct>(
      (event, emit) async {
        if (state is FavoriteLoaded) {
          final state = this.state as FavoriteLoaded;
          emit(
            FavoriteLoaded(
              favorite: Favorite(
                products: List.from(state.favorite.products)
                  ..remove(event.product),
              ),
            ),
          );

          // Save updated favorites to local storage
          _saveFavorites(state.favorite);
        }
      },
    );
  }

  // Load favorites from local storage
  Future<void> _loadFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String favoritesJson = prefs.getString('favorites') ?? '[]';
    final List<dynamic> favoritesData = json.decode(favoritesJson);

    final List<Product> favorites = favoritesData
        .map((productData) =>
            Product.fromJson(productData as Map<String, dynamic>))
        .toList();

    emit(FavoriteLoaded(
        favorite:
            Favorite(products: favorites))); // Emit the FavoriteLoaded state
  }

  // Save favorites to local storage
  Future<void> _saveFavorites(Favorite favorite) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String favoritesJson = json.encode(favorite.products);
    prefs.setString('favorites', favoritesJson);
  }
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:goodiemap_app/models/cart_model.dart';
import 'package:goodiemap_app/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  List<SavedCart> savedCarts = [];
  CartBloc() : super(CartLoading()) {
    on<CartStarted>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const CartLoaded());
    });
    on<CartProductAdded>(
      (event, emit) async {
        if (state is CartLoaded) {
          final state = this.state as CartLoaded;
          emit(
            CartLoaded(
              cart: Cart(
                products: List<Product>.from(state.cart.products)
                  ..add(event.product),
                savedCarts: List<SavedCart>.from(savedCarts),
              ),
            ),
          );
        }
      },
    );

    on<CartProductRemoved>(
      (event, emit) async {
        if (state is CartLoaded) {
          final state = this.state as CartLoaded;
          emit(
            CartLoaded(
              cart: Cart(
                products: List<Product>.from(state.cart.products)
                  ..remove(event.product),
                savedCarts: List<SavedCart>.from(savedCarts),
              ),
            ),
          );
        }
      },
    );

    on<RemoveProducts>(
      (event, emit) async {
        if (state is CartLoaded) {
          final state = this.state as CartLoaded;

          // Find the product to be removed based on equality check
          final updatedProducts = List<Product>.from(state.cart.products)
            ..removeWhere((product) => product == event.product);

          emit(
            CartLoaded(
              cart: Cart(
                  products: updatedProducts,
                  savedCarts: List<SavedCart>.from(savedCarts)),
            ),
          );
        }
      },
    );

    on<SaveCartEvent>(
      (event, emit) async {
        if (state is CartLoaded) {
          final state = this.state as CartLoaded;

          final savedCart = SavedCart(
            products: List<Product>.from(
                state.cart.products), // Save only the products in the cart
            date: DateTime.now(),
          );

          savedCarts.add(savedCart);

          emit(
            CartLoaded(
              cart: Cart(
                products: const [], // Clear the current cart after saving
                savedCarts: List<SavedCart>.from(savedCarts),
              ),
            ),
          );
        }
      },
    );
    on<AddSavedCartToCart>(
      (event, emit) async {
        if (state is CartLoaded) {
          final state = this.state as CartLoaded;

          // Add all products from the selected saved cart to the current cart
          final updatedProducts = List<Product>.from(state.cart.products)
            ..addAll(event.savedCart.products);

          emit(
            CartLoaded(
              cart: Cart(
                products: updatedProducts,
                savedCarts: state.cart.savedCarts,
              ),
            ),
          );
        }
      },
    );
  }
}

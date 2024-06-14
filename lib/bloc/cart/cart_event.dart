part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartProductAdded extends CartEvent {
  final Product product;

  const CartProductAdded(this.product);
  @override
  List<Object> get props => [product];
}

class CartProductRemoved extends CartEvent {
  final Product product;

  const CartProductRemoved(this.product);
  @override
  List<Object> get props => [product];
}

class RemoveProducts extends CartEvent {
  final Product product;
  // Remove the product parameter from this event
  const RemoveProducts(this.product);
  @override
  List<Object> get props => [product];
}

class SaveCartEvent extends CartEvent {}

class AddSavedCartToCart extends CartEvent {
  final SavedCart savedCart;

  const AddSavedCartToCart(this.savedCart);

  @override
  List<Object> get props => [savedCart];
}

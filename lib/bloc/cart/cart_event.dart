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

class RemoveAllProducts extends CartEvent {
  final Product product;

  const RemoveAllProducts(this.product);
  @override
  List<Object> get props => [product];
}

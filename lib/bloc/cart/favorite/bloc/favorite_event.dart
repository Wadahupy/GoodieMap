part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class StartFavorite extends FavoriteEvent {
  @override
  List<Object> get props => [];
}

class AddFavoriteProduct extends FavoriteEvent {
  final Product product;

  const AddFavoriteProduct(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveFavoriteProduct extends FavoriteEvent {
  final Product product;

  const RemoveFavoriteProduct(this.product);

  @override
  List<Object> get props => [product];
}

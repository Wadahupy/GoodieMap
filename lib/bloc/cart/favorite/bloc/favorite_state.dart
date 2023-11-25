part of 'favorite_bloc.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteLoading extends FavoriteState {}

final class FavoriteLoaded extends FavoriteState {
  final Favorite favorite;

  const FavoriteLoaded({this.favorite = const Favorite()});

  @override
  List<Object> get props => [favorite];
}

final class FavoriteError extends FavoriteState {}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:goodiemap_app/models/favorite_model.dart';

import '../../../../models/models.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteLoading()) {
    on<StartFavorite>((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(const FavoriteLoaded());
    });
    on<AddFavoriteProduct>(
      (event, emit) async {
        if (state is FavoriteLoaded) {
          final state = this.state as FavoriteLoaded;
          emit(
            FavoriteLoaded(
              favorite: Favorite(
                products: List.from(state.favorite.products)
                  ..add(event.product),
              ),
            ),
          );
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
        }
      },
    );
  }
}

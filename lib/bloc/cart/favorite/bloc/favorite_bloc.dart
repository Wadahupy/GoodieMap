import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:goodiemap_app/models/favorite_model.dart';
import 'package:goodiemap_app/repositories/local_storage/local_storage_repository.dart';
import 'package:hive/hive.dart';

import '../../../../models/models.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final LocalStorageRepository _localStorageRepository;

  FavoriteBloc({required LocalStorageRepository localStorageRepository})
      : _localStorageRepository = localStorageRepository,
        super(FavoriteLoading()) {
    on<StartFavorite>(_onStartFavorite);
    on<AddFavoriteProduct>(_onAddProductToFavorite);
    on<RemoveFavoriteProduct>(_onRemoveProductFromFavorite);
  }

  void _onStartFavorite(
    StartFavorite event,
    Emitter<FavoriteState> emit,
  ) async {
    emit(FavoriteLoading());
    try {
      Box box = await _localStorageRepository.openBox();
      List<Product> products = _localStorageRepository.getFavorite(box);
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(
        FavoriteLoaded(
          favorite: Favorite(products: products),
        ),
      );
    } catch (e, stackTrace) {
      print('Error in StartFavorite: $e');
      print('StackTrace: $stackTrace');
      emit(FavoriteError());
    }
  }

  void _onAddProductToFavorite(
    AddFavoriteProduct event,
    Emitter<FavoriteState> emit,
  ) async {
    if (state is FavoriteLoaded) {
      try {
        Box box = await _localStorageRepository.openBox();
        _localStorageRepository.addProductToFavorite(box, event.product);

        emit(
          FavoriteLoaded(
            favorite: Favorite(
              products: List.from((state as FavoriteLoaded).favorite.products)
                ..add(event.product),
            ),
          ),
        );
      } on Exception {
        emit(FavoriteError());
      }
    }
  }

  void _onRemoveProductFromFavorite(
    RemoveFavoriteProduct event,
    Emitter<FavoriteState> emit,
  ) async {
    if (state is FavoriteLoaded) {
      try {
        Box box = await _localStorageRepository.openBox();
        _localStorageRepository.removeProductFromFavorite(box, event.product);

        emit(
          FavoriteLoaded(
            favorite: Favorite(
              products: List.from((state as FavoriteLoaded).favorite.products)
                ..remove(event.product),
            ),
          ),
        );
      } on Exception {
        emit(FavoriteError());
      }
    }
  }
}

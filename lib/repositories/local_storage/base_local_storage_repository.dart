import 'package:hive/hive.dart';

import '/models/models.dart';

abstract class BaseLocalStorageRepository {
  Future<Box> openBox();
  List<Product> getFavorite(Box box);
  Future<void> addProductToFavorite(Box box, Product product);
  Future<void> removeProductFromFavorite(Box box, Product product);
  Future<void> clearFavorite(Box box);
}

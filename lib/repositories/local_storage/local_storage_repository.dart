import 'package:hive/hive.dart';

import '/repositories/repositories.dart';
import '/models/models.dart';

class LocalStorageRepository extends BaseLocalStorageRepository {
  String boxName = 'favorite_products';
  Type boxType = Product;

  @override
  Future<Box> openBox() async {
    Box box = await Hive.openBox<Product>(boxName);
    return box;
  }

  @override
  List<Product> getFavorite(Box box) {
    return box.values.toList() as List<Product>;
  }

  @override
  Future<void> addProductToFavorite(Box box, Product product) async {
    await box.put(product.id, product);
  }

  @override
  Future<void> clearFavorite(Box box) async {
    await box.clear();
  }

  @override
  Future<void> removeProductFromFavorite(Box box, Product product) async {
    await box.delete(product.id);
  }
}

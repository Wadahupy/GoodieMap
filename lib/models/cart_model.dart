import 'package:equatable/equatable.dart';
import 'package:goodiemap_app/models/product_model.dart';

class Cart extends Equatable {
  final List<Product> products;
  const Cart({this.products = const <Product>[]});

  Map productQuantity(products) {
    var quantity = {};

    products.forEach((product) {
      if (!quantity.containsKey(product)) {
        quantity[product] = 1;
      } else {
        quantity[product] += 1;
      }
    });
    return quantity;
  }

  int totalQuantity() {
    var quantityMap = productQuantity(products);

    // Count the total number of unique items
    int totalQuantity = quantityMap.length;

    return totalQuantity;
  }

  double get total =>
      products.fold(0, (total, current) => total + current.price);

  String get totalString => total.toStringAsFixed(2);

  @override
  List<Object?> get props => [products];
}

import 'package:equatable/equatable.dart';
import 'package:goodiemap_app/models/models.dart';

class Search extends Equatable {
  final List<Product> products;
  const Search({this.products = const <Product>[]});

  @override
  List<Object?> get props => [products];
}

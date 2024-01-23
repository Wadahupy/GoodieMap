import 'package:equatable/equatable.dart' show Equatable;
import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class Product extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final String imgUrl;
  @HiveField(4)
  final double price;
  @HiveField(5)
  final String description;
  @HiveField(6)
  final double barcode;
  @HiveField(7)
  final String location;
  @HiveField(8)
  final bool isPopular;
  @HiveField(9)
  final bool isRecommended;

  const Product(
      {required this.id,
      required this.name,
      required this.category,
      required this.imgUrl,
      required this.price,
      required this.description,
      required this.barcode,
      required this.location,
      required this.isPopular,
      required this.isRecommended});

  // factory Product.fromJson(Map<String, dynamic> json) {
  //   return Product(
  //     id: json['id'] ?? '',
  //     name: json['name'] ?? '',
  //     category: json['category'] ?? '',
  //     imgUrl: json['imgUrl'] ?? '',
  //     price: (json['price'] ?? 0.0).toDouble(),
  //     description: json['description'] ?? '',
  //     barcode: (json['barcode'] ?? 0).toDouble(),
  //     location: json['location'] ?? '',
  //     isPopular: json['isPopular'] ?? false,
  //     isRecommended: json['isRecommended'] ?? false,
  //   );
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'category': category,
  //     'imgUrl': imgUrl,
  //     'price': price,
  //     'description': description,
  //     'barcode': barcode,
  //     'location': location,
  //     'isPopular': isPopular,
  //     'isRecommended': isRecommended,
  //   };
  // }

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        imgUrl,
        price,
        description,
        barcode,
        location,
        isPopular,
        isRecommended
      ];

  static List<Product> products = [
    const Product(
      id: 1,
      name: 'EDEN SINGLES/SLICES 10SX208G',
      category: 'Dairy and Deli',
      imgUrl: 'https://pgmobile.puregold.com.ph/images/7622210641311.jpg?v=25',
      price: 100.05,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
      barcode: 4800361413480,
      location:
          'https://images.pexels.com/photos/6865456/pexels-photo-6865456.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      isPopular: true,
      isRecommended: false,
    ),
    const Product(
      id: 2,
      name: 'CHEEZ WHIZ PLAIN 210G',
      category: 'Dairy and Deli',
      imgUrl: 'https://pgmobile.puregold.com.ph/images/4808647010026.jpg?v=75',
      price: 81.00,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
      barcode: 12345678910,
      location:
          'https://images.pexels.com/photos/264636/pexels-photo-264636.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      isPopular: true,
      isRecommended: true,
    ),
    const Product(
      id: 3,
      name: 'EDEN FILLED CHEESE 160G',
      category: 'Dairy and Deli',
      imgUrl: 'https://pgmobile.puregold.com.ph/images/8318282.jpg?v=94',
      price: 99.00,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
      barcode: 12345678910,
      location:
          'https://images.pexels.com/photos/6865456/pexels-photo-6865456.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      isPopular: true,
      isRecommended: true,
    ),
    const Product(
      id: 4,
      name: 'MAGGI MAGIC SARAP 8GX16S',
      category: 'Dairy and Deli',
      imgUrl: 'https://pgmobile.puregold.com.ph/images/8271761.jpg?v=27',
      price: 193.95,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
      barcode: 12345678910,
      location:
          'https://images.pexels.com/photos/2449665/pexels-photo-2449665.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      isPopular: true,
      isRecommended: true,
    ),
  ];
}

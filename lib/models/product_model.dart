import 'package:equatable/equatable.dart' show Equatable;

class Product extends Equatable {
  final String name;
  final String category;
  final String imgUrl;
  final double price;
  final String description;
  final double barcode;
  final String location;
  final bool isPopular;
  final bool isRecommended;

  const Product(
      {required this.name,
      required this.category,
      required this.imgUrl,
      required this.price,
      required this.description,
      required this.barcode,
      required this.location,
      required this.isPopular,
      required this.isRecommended});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] ?? '',
      category: json['category'] ?? '',
      imgUrl: json['imgUrl'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      description: json['description'] ?? '',
      barcode: (json['barcode'] ?? 0).toDouble(),
      location: json['location'] ?? '',
      isPopular: json['isPopular'] ?? false,
      isRecommended: json['isRecommended'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'imgUrl': imgUrl,
      'price': price,
      'description': description,
      'barcode': barcode,
      'location': location,
      'isPopular': isPopular,
      'isRecommended': isRecommended,
    };
  }

  @override
  List<Object?> get props => [
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

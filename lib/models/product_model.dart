import 'package:equatable/equatable.dart' show Equatable;

class Product extends Equatable {
  final String name;
  final String category;
  final String imgUrl;
  final double price;
  final String description;
  final String location;
  final bool isPopular;
  final bool isRecommended;

  const Product(
      {required this.name,
      required this.category,
      required this.imgUrl,
      required this.price,
      required this.description,
      required this.location,
      required this.isPopular,
      required this.isRecommended});

  @override
  List<Object?> get props => [
        name,
        category,
        imgUrl,
        price,
        description,
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
      location:
          'https://images.pexels.com/photos/264636/pexels-photo-264636.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      isPopular: true,
      isRecommended: true,
    ),
    const Product(
      name: 'EDEN FILLED CHEESE 160G BUY 2 PCS , SAVE 13% OFF',
      category: 'Dairy and Deli',
      imgUrl: 'https://pgmobile.puregold.com.ph/images/8318282.jpg?v=94',
      price: 99.00,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
      location:
          'https://images.pexels.com/photos/6865456/pexels-photo-6865456.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      isPopular: true,
      isRecommended: true,
    ),
    const Product(
      name: 'MAGGI MAGIC SARAP 8GX16S BUY 3 GET FREE 1',
      category: 'Dairy and Deli',
      imgUrl: 'https://pgmobile.puregold.com.ph/images/8271761.jpg?v=27',
      price: 193.95,
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
      location:
          'https://images.pexels.com/photos/2449665/pexels-photo-2449665.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      isPopular: true,
      isRecommended: true,
    ),
  ];
}

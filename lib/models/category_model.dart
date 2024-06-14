import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;
  final String section;

  const Category(
      {required this.imageUrl, required this.name, required this.section});

  @override
  List<Object?> get props => [name, section, imageUrl];

  static List<Category> categories = [
    const Category(
      name: 'Condiments Sauces & Dress',
      section: 'SECTION 1',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%201.jpg?alt=media&token=198dbb2b-a709-4446-96ec-fac490c3ba77',
    ),
    const Category(
      name: 'Drinks & Canned Goods',
      section: 'SECTION 2',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%202.jpg?alt=media&token=8d8e502b-6f0b-45a7-adbe-c694805f6489',
    ),
    const Category(
      name: 'Beverages & Treats',
      section: 'SECTION 3',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%203.jpg?alt=media&token=6a238428-3018-4cef-a205-6324377816e6',
    ),
    const Category(
      name: 'Biscuits & Sweets',
      section: 'SECTION 4',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%204.jpg?alt=media&token=9772d44e-b85a-4e62-80eb-1c6b9538f362',
    ),
    const Category(
      name: 'Babycare & Beauty',
      section: 'SECTION 5',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%205.jpg?alt=media&token=81c61f2f-8be7-4966-bcaa-bb5055ca6f0b',
    ),
    const Category(
      name: 'Bath & Hygiene',
      section: 'SECTION 6',
      imageUrl:
          'https://firebasestorage.googleapis.com/v0/b/goodiemap.appspot.com/o/sections%2FSection%206.jpg?alt=media&token=ad6cf2b5-c003-4466-9286-2d986a7272d2',
    ),
  ];
}

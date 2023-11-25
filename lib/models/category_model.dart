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
    Category(
      name: 'Frozen Foods',
      section: 'SECTION 1',
      imageUrl:
          'https://assets.bonappetit.com/photos/57d6f59ac204478524d874a7/master/w_1600,c_limit/undefined',
    ),
    Category(
      name: 'Dairy and Deli',
      section: 'SECTION 2',
      imageUrl:
          'https://www.refrigeratedfrozenfood.com/ext/resources/Issues/2021/January/Top25/Main-Photo.jpg?1610387832',
    ),
  ];
}

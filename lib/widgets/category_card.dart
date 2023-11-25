import 'package:flutter/material.dart';
import 'package:goodiemap_app/models/models.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final double widthFactor;

  const CategoryCard({
    Key? key,
    required this.category,
    this.widthFactor = 2.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/catalog',
          arguments: category,
        );
      },
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Stack(
                alignment: Alignment
                    .bottomLeft, // Aligns the text to the bottom left corner
                children: [
                  Image.network(
                    category.imageUrl,
                    fit: BoxFit.cover,
                    height: 160,
                    width: 500,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 8, horizontal: 10), // Adjusted padding
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          category.section,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          category.name,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

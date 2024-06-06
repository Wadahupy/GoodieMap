// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
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
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Stack(
                alignment: Alignment
                    .bottomLeft, // Aligns the text to the bottom left corner
                children: [
                  CachedNetworkImage(
                    imageUrl: category.imageUrl, 
                      placeholder: (context, url,) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                    imageBuilder: (context,ImageProvider){
                      return Container(
                        height: 160,
                        width: 500,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: ImageProvider,
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    }
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 10), // Adjusted padding
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          category.section,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          category.name,
                          style: const TextStyle(
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

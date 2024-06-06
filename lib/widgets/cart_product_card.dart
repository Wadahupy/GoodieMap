// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodiemap_app/bloc/cart/cart_bloc.dart';
import 'package:goodiemap_app/models/product_model.dart';

class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;
  const CartProductCard({
    super.key,
    required this.product,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:  CachedNetworkImage(
                imageUrl: product.imgUrl, 
                  placeholder: (context, url,) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                imageBuilder: (context,ImageProvider){
                  return Container(
                    height: 90,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: ImageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    ' ₱ ${product.price}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              context
                                  .read<CartBloc>()
                                  .add(CartProductRemoved(product));
                            },
                            icon: const Icon(
                              Icons.remove_circle,
                              color: Color(0xFF46B177),
                            ),
                          ),
                          Text(
                            '$quantity',
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF46B177)),
                          ),
                          IconButton(
                            onPressed: () {
                              context
                                  .read<CartBloc>()
                                  .add(CartProductAdded(product));
                            },
                            icon: const Icon(
                              Icons.add_circle,
                              color: Color(0xFF46B177),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: InkWell(
                onTap: () {
                  context.read<CartBloc>().add(RemoveProducts(product));
                },
                child: const Icon(
                  Icons.delete_forever,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: file_names, library_private_types_in_public_api, unused_element

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodiemap_app/bloc/cart/cart_bloc.dart';
import 'package:badges/badges.dart' as badges;
import 'package:goodiemap_app/widgets/custom_search.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      elevation: 0.0,
      toolbarHeight: 70,
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Image.asset(
          'assets/GoodieMap_Logo(2).png',
          width: 40,
          height: 40,
          color: Colors.white,
        ),
      ),
      title: const Text(
        "GoodieMap",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
      ),
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            badges.Badge(
              position: BadgePosition.topEnd(top: 0, end: 3),
              badgeContent: Text(
                ' ${_getTotalQuantity(context)}',
                style: const TextStyle(color: Colors.white),
              ),
              badgeAnimation: const BadgeAnimation.scale(),
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
              ),
            ),
            const SizedBox(
              width: 14,
            ),
          ],
        )
      ],
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(28),
            bottomRight: Radius.circular(26),
          ),
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 95, 190, 138),
              Color.fromARGB(255, 19, 207, 182),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }

  // Helper method to get the total quantity
  int _getTotalQuantity(BuildContext context) {
    final cartState = context.watch<CartBloc>().state;

    if (cartState is CartLoaded) {
      return cartState.cart.totalQuantity();
    }

    return 0;
  }
}

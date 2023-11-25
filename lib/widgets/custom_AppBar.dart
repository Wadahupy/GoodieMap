import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodiemap_app/bloc/cart/cart_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      toolbarHeight: 70,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'GoodieMap',
            textAlign: TextAlign.center,
          ),
          SizedBox(width: 40),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          badges.Badge(
            position: BadgePosition.topEnd(top: 0, end: 3),
            badgeContent: Text(
              ' ${_getTotalQuantity(context)}',
              style: const TextStyle(color: Colors.white),
            ),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
            badgeAnimation: BadgeAnimation.scale(),
          ),
        ],
      ),
      centerTitle: true,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(28),
              bottomRight: Radius.circular(26)),
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 95, 190, 138),
            Color.fromARGB(255, 19, 207, 182)
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
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

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

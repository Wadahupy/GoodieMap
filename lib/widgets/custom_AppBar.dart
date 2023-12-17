import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goodiemap_app/bloc/cart/cart_bloc.dart';
import 'package:badges/badges.dart' as badges;

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
  final TextEditingController _searchController = TextEditingController();
  bool isSearchClicked = false;
  String searchText = '';
  List<String> items = [
    'Items 1',
    'Messi',
    'Ronaldo',
    'Virat Kohli',
    '2',
    'Rock',
    'Elon Musk',
  ];

  List<String> filteredItems = [];
  @override
  void initState() {
    super.initState();
    filteredItems = List.from(items);
  }

  void _onSearchChanged(String value) {
    setState(() {
      searchText = value;
      myFilterItems();
    });
  }

  void myFilterItems() {
    if (searchText.isEmpty) {
      filteredItems = List.from(items);
    } else {
      filteredItems = items
          .where(
              (item) => item.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      toolbarHeight: 70,
      title: isSearchClicked
          ? Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (context) {},
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    hintText: 'Search..'),
              ),
            )
          : const Text("GoodieMap"),
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  isSearchClicked = !isSearchClicked;
                  if (!isSearchClicked) {
                    _searchController.clear();
                    myFilterItems();
                  }
                });
              },
              icon: Icon(isSearchClicked ? Icons.close : Icons.search),
            ),
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

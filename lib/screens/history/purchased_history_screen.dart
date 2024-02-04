import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goodiemap_app/bloc/cart/cart_bloc.dart';
import 'package:goodiemap_app/models/cart_model.dart';
import 'package:goodiemap_app/models/models.dart';
import 'package:goodiemap_app/widgets/cart_saved_card.dart';

// Create a new SavedCartsScreen or Pop-up
class SavedCartsScreen extends StatelessWidget {
  const SavedCartsScreen({super.key});

  static const String routeName = '/saved';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SavedCartsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF46B177), size: 50),
        title: const Text(
          'History',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color(0xFF46B177),
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            final savedCarts = state.cart.savedCarts;

            // Display the list of saved carts
            return ListView.builder(
              itemCount: savedCarts.length,
              itemBuilder: (context, index) {
                final savedCart = savedCarts[index];
                return Material(
                  child: ListTile(
                    leading: const Icon(
                      Icons.shopping_bag,
                      color: Colors.green,
                      size: 40,
                    ),
                    title: Text('Date: ${savedCart.date}',
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                    trailing: const Icon(Icons.arrow_forward_ios,
                        color: Colors.green, size: 40),
                    onTap: () {
                      // Navigate to the detail screen when the card is clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SavedCartDetailScreen(savedCart: savedCart),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else {
            return const Text('No saved carts');
          }
        },
      ),
    );
  }
}

class SavedCartDetailScreen extends StatelessWidget {
  final SavedCart savedCart;

  const SavedCartDetailScreen({super.key, required this.savedCart});

  @override
  Widget build(BuildContext context) {
    // Calculate the total price of the saved cart
    double total =
        savedCart.products.fold(0, (total, product) => total + product.price);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF46B177), size: 50),
        title: const Text(
          'Purchased History',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFF46B177),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date: ${savedCart.date}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF46B177),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Saved Products:',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF46B177),
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox.fromSize(
                    size: const Size(50, 50), // button width and height
                    child: ClipOval(
                      child: Material(
                        color: Colors.redAccent, // button color
                        child: InkWell(
                          onTap: () {
                            // Trigger an event to add the saved cart to the cart in the CartBloc
                            context
                                .read<CartBloc>()
                                .add(AddSavedCartToCart(savedCart));
                            // Optionally, navigate back to the cart screen
                            Navigator.pop(context);
                            // custom SnackBar
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      height: 90,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF46B177),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Row(
                                        children: [
                                          SizedBox(width: 48),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Successfully Added Again!',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  'Check your cart to see the products added',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 30,
                                      left: 10,
                                      child: SvgPicture.asset(
                                        "assets/shopping-cart.svg",
                                        height: 48,
                                        width: 40,
                                      ),
                                    ),
                                  ],
                                ),
                                duration: const Duration(seconds: 2),
                                behavior:
                                    SnackBarBehavior.fixed, // Set to fixed
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                              ),
                            );
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                              ), // icon
                              Text("Add",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)), // text
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount:
                    savedCart.productQuantity(savedCart.products).keys.length,
                itemBuilder: (context, index) {
                  return CartSavedCard(
                    product: savedCart
                        .productQuantity(savedCart.products)
                        .keys
                        .elementAt(index),
                    quantity: savedCart
                        .productQuantity(savedCart.products)
                        .values
                        .elementAt(
                            index), // Assuming quantity is always 1 for saved products
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                child: Container(
                  height: 70,
                  width: 500,
                  decoration: BoxDecoration(
                    color: const Color(0xFF46B177),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Price:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Display total price
                        Text(
                          '₱ ${total.toStringAsFixed(2)}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

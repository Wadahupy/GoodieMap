import 'package:flutter/material.dart';

class InforScreen extends StatelessWidget {
  const InforScreen({Key? key}) : super(key: key);

  static const String routeName = '/info';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const InforScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF46B177), size: 50),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/GoodieMap_Logo.png',
                height: 300,
                width: 1000,
              ),
              const SizedBox(height: 20),
              const Text(
                'What is GoodieMap App?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'GoodieMap App is a versatile mobile application designed to enhance your shopping experience. It empowers users to efficiently track their expenses and easily locate products within a grocery shopping store.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Key Features:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const ListTile(
                leading: Icon(Icons.monetization_on, color: Color(0xFF46B177)),
                title: Text(
                  'Real-time Expense Tracking',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.map, color: Color(0xFF46B177)),
                title: Text(
                  'Product Map for Grocery Stores',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.qr_code_scanner, color: Color(0xFF46B177)),
                title: Text(
                  'Scan and Identify Products Instantly',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.shopping_cart, color: Color(0xFF46B177)),
                title: Text(
                  'Effortless Grocery Shopping Experience',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.location_on, color: Color(0xFF46B177)),
                title: Text(
                  'Find Products in Store with Location Services',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Credits to Puregold Store:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Special thanks to Puregold Store for their support in making GoodieMap App a valuable tool for grocery shoppers.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                'Copyright Act:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '© 2024 GoodieMap App. All rights reserved. Unauthorized use and/or duplication of this material without express and written permission is strictly prohibited.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

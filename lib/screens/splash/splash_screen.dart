// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = '/splash';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(); // Wait for Firebase initialization

      final prefs = await SharedPreferences.getInstance();

      String? userEmail = prefs.getString('userEmail');
      if (userEmail != null) {
        // User has saved email, check if Firebase user is also present
        User? currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser != null) {
          Navigator.popAndPushNamed(context, '/');
        } else {
          // Firebase user not present, navigate to the '/account' screen
          Navigator.popAndPushNamed(context, '/account');
        }
      } else {
        // No saved email, navigate to the '/account' screen
        Navigator.popAndPushNamed(context, '/account');
      }
    });
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: AssetImage('assets/GoodieMap_Logo.png'),
                width: 500,
                height: 500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:goodiemap_app/screens/onboarding/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool showHome = true;

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
      final prefs = await SharedPreferences.getInstance();
      showHome = prefs.getBool('showHome') ?? true;

      Navigator.pushNamed(context, showHome ? Onboarding.routeName : '/');
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage('images/logo1.png'),
              width: 125,
              height: 125,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: const Color(0xFF46B177),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              'GoodieMap',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

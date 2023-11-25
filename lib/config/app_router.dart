import 'package:flutter/material.dart';
import 'package:goodiemap_app/models/category_model.dart';
import 'package:goodiemap_app/models/product_model.dart';
import 'package:goodiemap_app/screens/product/product_screen.dart';
import 'package:goodiemap_app/screens/screens.dart';
import 'package:goodiemap_app/screens/sign_up/sign_up_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('this is route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return homePage.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case Onboarding.routeName:
        return Onboarding.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case MapScreen.routeName:
        return MapScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case productScreen.routeName:
        return productScreen.route(product: settings.arguments as Product);
      case SignIn.routeName:
        return SignIn.route();
      case SignUp.routeName:
        return SignUp.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text('Error')),
      ),
    );
  }
}

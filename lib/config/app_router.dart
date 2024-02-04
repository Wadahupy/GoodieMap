import 'package:flutter/material.dart';
import 'package:goodiemap_app/models/category_model.dart';
import 'package:goodiemap_app/models/product_model.dart';
import 'package:goodiemap_app/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    // ignore: avoid_print
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
      case AccountSelect.routeName:
        return AccountSelect.route();
      case ForgotPass.routeName:
        return ForgotPass.route();
      case InforScreen.routeName:
        return InforScreen.route();
      case SavedCartsScreen.routeName:
        return SavedCartsScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
      ),
    );
  }
}

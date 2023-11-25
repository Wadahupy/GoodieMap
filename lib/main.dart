import 'package:flutter/material.dart';
import 'package:goodiemap_app/bloc/cart/cart_bloc.dart';
import 'package:goodiemap_app/bloc/cart/favorite/bloc/favorite_bloc.dart';
import 'package:goodiemap_app/config/app_router.dart';
// import 'package:goodiemap_app/screens/home/home_screen.dart';
import 'package:goodiemap_app/screens/screens.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:provider/provider.dart';
// import 'pages/account_selection.dart';
// import 'pages/onboarding.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // final prefs = await SharedPreferences.getInstance();
  // showHome = prefs.getBool('showHome') ?? true;
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(create: (_) => FavoriteBloc()..add(StartFavorite())),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: const Color(0xFF46B177),
          ),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName),
    );

    // routes: {
    //   // '/': (context) => showHome ? const Onboarding() : const homePage(),
    //   // '/cart': (context) => const CartScreen(),
    //   // '/catalog': (context) => const catalogScreen(),
    //   // '/product': (context) => const productScreen(),
    // },
  }
}

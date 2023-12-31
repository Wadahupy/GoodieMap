import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goodiemap_app/bloc/cart/cart_bloc.dart';
import 'package:goodiemap_app/bloc/cart/favorite/bloc/favorite_bloc.dart';
import 'package:goodiemap_app/config/app_router.dart';
import 'package:goodiemap_app/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:goodiemap_app/bloc/cart/cart_bloc.dart';
import 'package:goodiemap_app/bloc/cart/favorite/bloc/favorite_bloc.dart';
import 'package:goodiemap_app/config/app_router.dart';
import 'package:goodiemap_app/provider/theme_provider.dart';
import 'package:goodiemap_app/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBOPFrIgmgro018e9WU04Rc4lfIVwGLjVI",
            appId: "1:71960387681:web:5a73e79f5fd51dd20cca20",
            messagingSenderId: "71960387681",
            projectId: "goodiemap"));
  }
  await Firebase.initializeApp();
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(create: (_) => FavoriteBloc()..add(StartFavorite())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            themeMode: themeProvider.themeMode,
            debugShowCheckedModeBanner: false,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: SplashScreen.routeName,
          );
        },
      ),
    );
  }

  // routes: {
  //   // '/': (context) => showHome ? const Onboarding() : const homePage(),
  //   // '/cart': (context) => const CartScreen(),
  //   // '/catalog': (context) => const catalogScreen(),
  //   // '/product': (context) => const productScreen(),
  // },
}

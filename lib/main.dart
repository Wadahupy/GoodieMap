import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:goodiemap_app/bloc/cart/cart_bloc.dart';
import 'package:goodiemap_app/bloc/cart/favorite/bloc/favorite_bloc.dart';
import 'package:goodiemap_app/config/app_router.dart';
import 'package:goodiemap_app/models/product_model.dart';
import 'package:goodiemap_app/provider/theme_provider.dart';
import 'package:goodiemap_app/repositories/local_storage/local_storage_repository.dart';
import 'package:goodiemap_app/repositories/repositories.dart';
import 'package:goodiemap_app/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

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
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  // Check if the user is already signed in
  if (FirebaseAuth.instance.currentUser == null) {
    // If not signed in, attempt auto-login
    await attemptAutoLogin();
  }
  // Create a variable to store the theme provider
  final themeProvider = ThemeProvider();

  // Load the theme data
  await themeProvider.loadThemeMode();
  runApp(const Myapp());
}

Future<void> attemptAutoLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? storedEmail = prefs.getString('email');
  String? storedPassword = prefs.getString('password');

  // If both email and password are available, attempt to sign in
  if (storedEmail != null && storedPassword != null) {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: storedEmail,
        password: storedPassword,
      );
    } catch (e) {
      // Handle sign-in errors
      if (kDebugMode) {
        print("Auto-login error: $e");
      }
    }
  }
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        themeProvider.initApp(context);

        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
            BlocProvider(
              create: (_) => FavoriteBloc(
                localStorageRepository: LocalStorageRepository(),
              )..add(StartFavorite()),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            builder: (context, _) {
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
      },
    );
  }
}

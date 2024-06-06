// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:goodiemap_app/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  static const String routeName = '/sign_in';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SignIn(),
    );
  }

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _passwordVisible = false;
  bool _rememberMe = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  String _email = "";
  String _password = "";

  void _handleLogin() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      // Check if the email is saved in shared preferences
      if (prefs.containsKey('userEmail') &&
          prefs.getBool('rememberMe') == true) {
        _email = prefs.getString('userEmail') ?? '';
        _emailController.text = _email;
        _rememberMe = true;
      } else {
        _email = _emailController.text;
      }

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      // Check if the user's email is verified
      if (userCredential.user?.emailVerified == true) {
        // User successfully logged in
        print('User Logged In: ${userCredential.user?.email}');

        if (_rememberMe) {
          // Save user's email and "Remember Me" preference to shared preferences
          prefs.setString('userEmail', _email);
          prefs.setBool('rememberMe', true);
        } else {
          // Clear saved email and "Remember Me" preference if remember me is false
          prefs.remove('userEmail');
          prefs.remove('rememberMe');
        }

        // Navigate to the desired screen (e.g., home screen)
        Navigator.popAndPushNamed(context, '/');
      } else {
        // If email is not verified, send a verification email
        await userCredential.user?.sendEmailVerification();

        // Display a message to inform the user to verify their email
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/smartphone.svg',
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Verify your email!',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Email is not verified. Check your email to verify your account.',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Handle sign-in errors
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid email or password. Please try again.'),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: SizedBox(
              width: double.infinity, // Set width to maximum available width
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/warning.svg', // Replace with your actual SVG file path
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Login Failed!',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Error in Login: $e',
                          style: const TextStyle(
                              fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF46B177),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white, size: 50),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFF46B177),
          child: Column(
            children: <Widget>[
              const Padding(
                padding:
                    EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 15),
                child: Text(
                  'Sign In your Account',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: 543,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 50),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 10.0, left: 10.0),
                          child: Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: themeProvider.isDarkMode
                                  ? Colors
                                      .white // Set the text color for dark mode
                                  : Colors
                                      .black45, // Set the text color for light mode
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Your Email";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _email = value;
                                });
                              },
                              key: _emailKey,
                              controller: _emailController,
                              autofocus: true,
                              cursorColor: Colors.green,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: "Enter Email",
                                prefixIcon: const Icon(Icons.email),
                                prefixIconColor: WidgetStateColor.resolveWith(
                                    (states) =>
                                        states.contains(WidgetState.focused)
                                            ? Colors.green
                                            : Colors.grey),
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 3,
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(
                                    width: 3,
                                    color: Color(0xFF46B177),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 10.0, left: 10.0),
                          child: Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: themeProvider.isDarkMode
                                  ? Colors
                                      .white // Set the text color for dark mode
                                  : Colors
                                      .black45, // Set the text color for light mode
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Your Password";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  _password = value;
                                });
                              },
                              key: _passwordKey,
                              controller: _passController,
                              autofocus: true,
                              cursorColor: Colors.green,
                              obscureText: !_passwordVisible,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                hintText: "Enter Password",
                                prefixIcon: const Icon(
                                  Icons.lock,
                                ),
                                prefixIconColor: WidgetStateColor.resolveWith(
                                    (states) =>
                                        states.contains(WidgetState.focused)
                                            ? Colors.green
                                            : Colors.grey),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    // Update the state of toggle
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: const BorderSide(
                                    width: 3,
                                    color: Color(0xFF46B177),
                                  ),
                                ),
                                hintStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 3,
                                    color: Colors.black12,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Checkbox(
                                checkColor: Colors.green,
                                value: _rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value!;
                                  });
                                },
                                activeColor:
                                    const Color.fromARGB(255, 219, 218, 218)),
                            const Text(
                              'Remember me?',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.green),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/forgot');
                              },
                              child: const Text(
                                'Forgot password',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.green),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: SizedBox(
                            width: 350,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _handleLogin();
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(
                                    const Color(0xFF057A3B)),
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                              ),
                              child: const Text(
                                "SIGN IN",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white, // Text color
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(
                color: Color.fromARGB(255, 219, 219, 219),
                height: 1,
                thickness: 2,
              ),
              Container(
                height: 100,
                width: 1000,
                color: Theme.of(context).colorScheme.surface,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Dont have an Account?',
                        style: TextStyle(fontSize: 18, color: Colors.green),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/sign_up');
                        },
                        child: const Text('Sign Up',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF057A3B),
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
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

// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  static const String routeName = '/sign_up';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const SignUp(),
    );
  }

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _passwordVisible = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  String _email = "";
  String _password = "";

  void _handleSignUp() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user!.email)
          .set({'username': _userController.text, 'email': _email});

      // User successfully created
      Navigator.pop(context); // Remove this line if it's causing issues

      Navigator.popAndPushNamed(context, '/onboarding');
    } on FirebaseAuthException catch (e) {
      // Handle sign-up errors
      print(e.code);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error during sign up: ${e.message}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    EdgeInsets.only(top: 10, left: 20, right: 30, bottom: 15),
                child: Text(
                  'Create your Account',
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
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0, left: 10.0),
                          child: Text(
                            'Username',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.black45),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please Enter Your Username";
                                }
                                return null;
                              },
                              controller: _userController,
                              autofocus: true,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: "Enter Username",
                                prefixIcon: const Icon(Icons.person),
                                prefixIconColor: MaterialStateColor.resolveWith(
                                    (states) =>
                                        states.contains(MaterialState.focused)
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
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0, left: 10.0),
                          child: Text(
                            'Email',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.black45),
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
                              controller: _emailController,
                              autofocus: true,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: "Enter Email",
                                prefixIcon: const Icon(Icons.email),
                                prefixIconColor: MaterialStateColor.resolveWith(
                                    (states) =>
                                        states.contains(MaterialState.focused)
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
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10.0, left: 10.0),
                          child: Text(
                            'Password',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.black45),
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
                                prefixIconColor: MaterialStateColor.resolveWith(
                                    (states) =>
                                        states.contains(MaterialState.focused)
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
                                    // Update the state i.e., toggle the state of passwordVisible variable
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
                        const SizedBox(height: 20),
                        Center(
                          child: SizedBox(
                            width: 350,
                            height: 60, // Reduced button height
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _handleSignUp();
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFF057A3B)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                              ),
                              child: const Text(
                                "SIGN UP",
                                style: TextStyle(
                                  fontSize: 24, // Adjusted font size
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Center(
                          child: Text(
                            'By Signing in with us, you agree to our',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () {},
                            child: const Text('Terms & Privacy Policy',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold)),
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
                width: 420,
                color: Colors.white,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an Account?',
                        style: TextStyle(fontSize: 18, color: Colors.green),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/sign_in');
                        },
                        child: const Text('Sign In',
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

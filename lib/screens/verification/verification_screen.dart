import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  static const String routeName = '/verification';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const VerificationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF46B177),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white, size: 50),
      ),
      body: Container(
        color: const Color(0xFF46B177),
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/Confirmed-bro.svg',
                height: 400,
                width: 400,
              ),
              const Text('VERIFY YOUR ACCOUNT',textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,)),
              const Text('Please check your email to verify',textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,),),
              const SizedBox(height: 40,),
              Column(
                children: [
                  SizedBox(
                    width: 310,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign_in');
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.white),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Sign In Now",
                        style: TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(244, 53, 202, 185), // Text color
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    width: 310,
                    height: 55,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign_in');
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(Colors.transparent),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                            side: const BorderSide(
                                color: Color(0xFF46B177), width: 3.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Sign up',
                        style:
                            TextStyle(fontSize: 30, color: Color(0xFF46B177)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
        
          ),
        ),
      ),
    );
  }
}
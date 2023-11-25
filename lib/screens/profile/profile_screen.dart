import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 500,
              color: Colors.green,
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/profile.jpg'),
                      radius: 70.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Jack Miller',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 5),
                      Text(
                        'jackmiller@gmail.com',
                        style: TextStyle(fontSize: 20, color: Colors.black45),
                      ),
                    ],
                  ),
                  // Add more widgets as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

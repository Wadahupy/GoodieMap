import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60)),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromARGB(255, 95, 190, 138),
                        Color.fromARGB(255, 19, 207, 182)
                      ],
                    ),
                  ),
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
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.email,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'jackmiller@gmail.com',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 50), // Adjust the height based on your layout
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shadowColor: Colors.grey.withOpacity(0.5),
                shape: RoundedRectangleBorder(),
                elevation: 5,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.only(right: 30),
                          child: Icon(
                            Icons.key,
                            color: const Color(0xFF46B177),
                          )),
                      Text(
                        'Change Password',
                        style: TextStyle(
                          fontSize: 20,
                          color: const Color(0xFF46B177),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 55,
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                width: 360,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.only(right: 40),
                        child: Icon(
                          Icons.mode_night,
                          color: const Color(0xFF46B177),
                        )),
                    Text(
                      'Night Mode',
                      style: TextStyle(
                          fontSize: 20,
                          color: const Color(0xFF46B177),
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80.0),
                      child: SwitchExample(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shadowColor: Colors.grey.withOpacity(0.5),
                shape: RoundedRectangleBorder(),
                elevation: 5,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.only(right: 30),
                          child: Icon(
                            Icons.logout,
                            color: const Color(0xFF46B177),
                          )),
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 20,
                          color: const Color(0xFF46B177),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: light,
      activeColor: Colors.green,
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}

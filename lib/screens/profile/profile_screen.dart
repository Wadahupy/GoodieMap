// ignore_for_file: avoid_print, non_constant_identifier_names

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Uint8List? _image;
  String _profilePictureUrl = '';

  @override
  void initState() {
    super.initState();
    loadProfilePicture();
  }

  Future<void> loadProfilePicture() async {
    print("Loading profile picture...");
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(currentUser.email)
          .get();

      if (snapshot.exists) {
        final userData = snapshot.data() as Map<String, dynamic>;
        final profilePictureUrl = userData['profilePictureUrl'];
        print("Profile picture URL: $profilePictureUrl");
        setState(() {
          _profilePictureUrl = profilePictureUrl ?? '';
        });
      }
    }
  }
  // Pick image from local device

  Future<void> selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);

      // Upload image to Firebase Storage
      String fileName =
          '${FirebaseAuth.instance.currentUser!.uid}_profile_picture.jpg';
      firebase_storage.Reference storageReference = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child('profile_pictures/$fileName');

      await storageReference.putFile(imageFile);

      // Retrieve download URL
      String downloadUrl = await storageReference.getDownloadURL();

      // Update Firestore document with the image URL
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.email)
          .update({'profilePictureUrl': downloadUrl});

      // Update _image to display the selected image
      setState(() {
        _image = File(pickedFile.path).readAsBytesSync();
        _profilePictureUrl = downloadUrl;
      });
    }
  }

  // User
  final currentUser = FirebaseAuth.instance.currentUser!;
  // User logged in
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // All user
  final userCollection = FirebaseFirestore.instance.collection("users");

  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Edit $field",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        content: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.black54),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          // Cancel button
          TextButton(
            child: const Text(
              'Cancel',
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black87),
            ),
            onPressed: () => Navigator.pop(context),
          ),

          // Save button
          TextButton(
            child: const Text(
              'Save',
              style: TextStyle(fontWeight: FontWeight.w500, color: Colors.red),
            ),
            onPressed: () {
              Navigator.of(context).pop(newValue);
              showDialog(
                  context: context,
                  builder: (context) {
                    return const AlertDialog(
                      content: Text('Successfully Updated!'),
                    );
                  });
            },
          ),
        ],
      ),
    );
    // Update in firestore
    if (newValue.trim().isNotEmpty) {
      // Only if there is something in the textfield
      await userCollection.doc(currentUser.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(currentUser.email)
            .snapshots(),
        builder: (context, snapshot) {
          // Get user data
          if (snapshot.hasData) {
            final UserData = snapshot.data!.data() as Map<String, dynamic>;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 350,
                        decoration: const BoxDecoration(
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
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 100),
                            Stack(
                              children: [
                                _image != null
                                    ? CircleAvatar(
                                        radius: 75,
                                        backgroundColor: Colors.white,
                                        child: CircleAvatar(
                                          radius: 70,
                                          backgroundImage: MemoryImage(_image!),
                                        ),
                                      )
                                    : _profilePictureUrl.isNotEmpty
                                        ? CircleAvatar(
                                            radius: 75,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  _profilePictureUrl),
                                              radius: 70,
                                            ),
                                          )
                                        : const CircleAvatar(
                                            radius: 75,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'assets/profile3.png'),
                                              radius: 70,
                                            ),
                                          ),
                                Positioned(
                                  bottom: -10,
                                  left: 80,
                                  child: IconButton(
                                    onPressed: selectImage,
                                    icon: const Icon(Icons.add_a_photo),
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(width: 40),
                                Text(
                                  UserData['username'],
                                  style: const TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => editField('username'),
                                  icon: const Icon(Icons.edit),
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.email,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  currentUser.email!,
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                      height: 50), // Adjust the height based on your layout
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      shape: const RoundedRectangleBorder(),
                      elevation: 5,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: const EdgeInsets.only(right: 30),
                                child: const Icon(
                                  Icons.key,
                                  color: Color(0xFF46B177),
                                )),
                            const Text(
                              'Change Password',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF46B177),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      height: 55,
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0,
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      width: 360,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              padding: const EdgeInsets.only(right: 40),
                              child: const Icon(
                                Icons.mode_night,
                                color: Color(0xFF46B177),
                              )),
                          const Text(
                            'Night Mode',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF46B177),
                                fontWeight: FontWeight.w500),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 80.0),
                            child: SwitchExample(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                            "Logout",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                          content: const Text(
                            'Are you sure you want to logout?',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.black45),
                          ),
                          actions: [
                            TextButton(
                              child: const Text(
                                'No',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87),
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                            TextButton(
                                child: const Text(
                                  'Yes',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.red),
                                ),
                                onPressed: () {
                                  _auth.signOut();
                                  Navigator.popAndPushNamed(
                                      context, '/account');
                                }),
                          ],
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      shape: const RoundedRectangleBorder(),
                      elevation: 5,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding: const EdgeInsets.only(right: 30),
                                child: const Icon(
                                  Icons.logout,
                                  color: Color(0xFF46B177),
                                )),
                            const Text(
                              'Logout',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xFF46B177),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
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

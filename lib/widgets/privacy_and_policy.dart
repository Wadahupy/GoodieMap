import 'package:flutter/material.dart';

class PrivacyAndPolicy extends StatelessWidget {
  const PrivacyAndPolicy({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Terms & Privacy Policy'),
      content: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. Introduction',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Welcome to Our App! This privacy policy outlines how we collect, use, and protect your personal information when you use our services.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '2. Information We Collect',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We collect various types of information to provide and improve our services to you. This includes:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '- Personal Information: Your name, email address, and other information you provide during account registration.'),
                  Text(
                      '- Usage Data: Information about how you interact with our app, such as pages visited and features used.'),
                  Text(
                      '- Device Information: Information about your device, including device type, operating system, and unique device identifiers.'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              '3. How We Use Your Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We use the collected information for various purposes, including:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('- Providing and maintaining our services.'),
                  Text(
                      '- Personalizing your experience and improving our app.'),
                  Text('- Sending periodic emails and notifications.'),
                  Text('- Responding to your inquiries or requests.'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              '4. Data Security',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We prioritize the security of your personal information and implement appropriate measures to protect it. However, no method of transmission over the internet or electronic storage is 100% secure, and we cannot guarantee absolute security.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              '5. Changes to This Privacy Policy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'We may update our privacy policy from time to time. Any changes will be posted on this app, and the effective date will be updated accordingly. It is your responsibility to review this privacy policy periodically for changes.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}

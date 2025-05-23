import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            CircleAvatar(radius: 40, backgroundColor: Colors.indigo),
            SizedBox(height: 16),
            Text('Name: [Full Name]'),
            Text('Address: [Address]'),
            Text('Phone: [Phone Number]'),
            Text('Field: [Job Field]'),
          ],
        ),
      ),
    );
  }
}

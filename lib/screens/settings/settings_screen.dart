import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Settings & Account Options'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                authProvider.logout();
                Navigator.pushReplacementNamed(context, "/");
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}

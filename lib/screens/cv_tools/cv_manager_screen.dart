import 'package:flutter/material.dart';

class CVManagerScreen extends StatelessWidget {
  const CVManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My CVs')),
      body: Center(
        child: Text(
          'Uploaded CVs and upload option will appear here',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}

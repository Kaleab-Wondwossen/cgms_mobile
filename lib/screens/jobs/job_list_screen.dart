import 'package:flutter/material.dart';

class JobListScreen extends StatelessWidget {
  const JobListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Find Jobs')),
      body: Center(
        child: Text(
          'Job Listings will appear here',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}

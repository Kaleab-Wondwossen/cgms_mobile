import 'package:flutter/material.dart';

import '../config/constants.dart';

class PersonalInfoContainer extends StatelessWidget {
  final Map<String, dynamic> user;

  const PersonalInfoContainer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.mediumGap * 7.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(AppSizes.mediumGap)),
        color: const Color.fromRGBO(232, 232, 232, 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRow(Icons.phone, 'Phone Number', user['phone_number'] ?? 'N/A'),
          _divider(),
          _buildRow(Icons.email, 'Email', user['email'] ?? 'N/A'),
          _divider(),
          _buildRow(Icons.person, 'Full Name', user['name'] ?? 'N/A'),
          _divider(),
          _buildRow(Icons.work, 'Job Field', user['job_field'] ?? 'N/A'),
        ],
      ),
    );
  }

  Widget _divider() => Divider(thickness: AppSizes.smallGap * .25, color: Colors.white);

  Widget _buildRow(IconData icon, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.smallGap, vertical: AppSizes.smallGap * 0.25),
      child: Row(
        children: [
          Icon(icon, color: const Color.fromRGBO(56, 103, 93, 1.0)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: AppSizes.tertiaryFontSize, color: Colors.black),
            ),
          ),
          Text(
            value,
            style: TextStyle(fontSize: AppSizes.tertiaryFontSize, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

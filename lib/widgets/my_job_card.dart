import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  final String title;
  final String company;
  final String location;
  final String description;
  final String workType;
  final String workMode;
  final String deadline;
  final String status;

  const JobCard({
    super.key,
    required this.title,
    required this.company,
    required this.location,
    required this.description,
    required this.workType,
    required this.workMode,
    required this.deadline,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Company Logo/Name & Status
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.indigo.shade100,
                child: Text(
                  company.isNotEmpty ? company[0].toUpperCase() : '?',
                  style: const TextStyle(color: Colors.indigo),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  company,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: status.toLowerCase() == 'open'
                      ? Colors.green.shade50
                      : Colors.red.shade50,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: status.toLowerCase() == 'open'
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: status.toLowerCase() == 'open'
                        ? Colors.green
                        : Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Job Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0A0A0A),
            ),
          ),

          const SizedBox(height: 4),

          // Location & Work Mode
          Text(
            "$location • $workMode • $workType",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 8),

          // Description (truncated)
          Text(
            description.length > 100
                ? "${description.substring(0, 100)}..."
                : description,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 8),

          // Deadline
          Row(
            children: [
              const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              Text(
                "Deadline: $deadline",
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

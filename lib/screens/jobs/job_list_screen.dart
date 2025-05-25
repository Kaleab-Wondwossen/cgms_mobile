import 'package:cgms/config/colors.dart';
import 'package:cgms/config/constants.dart';
import 'package:cgms/widgets/my_categories.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/job_provider.dart';
import '../../widgets/my_companies.dart';
import '../../widgets/my_job_card.dart';
import '../../widgets/my_search_bar.dart';

class JobListScreen extends StatefulWidget {
  const JobListScreen({super.key});

  @override
  State<JobListScreen> createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  final TextEditingController _searchController =
      TextEditingController(); // ✅ Declare here

  @override
  void dispose() {
    _searchController.dispose(); // ✅ Dispose the controller when not needed
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<JobsProvider>(context, listen: false).fetchJobs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final jobsProvider = Provider.of<JobsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CGMS',
          style: GoogleFonts.acme(
            fontSize: AppSizes.primaryFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            color: AppColors.primaryIconColor,
            onPressed: () {
              // Handle notifications
              debugPrint('Notifications tapped');
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            color: AppColors.primaryIconColor,
            onPressed: () {
              // Navigate to settings
              Navigator.pushNamed(context, '/Settings');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          MySearchBar(
            controller: _searchController,
            onChanged: (value) {
              debugPrint('User is searching for: $value');
              // You can filter jobs here based on `value`
            },
          ),
          const MyCategories(),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, AppSizes.largeGap * 8.5, 0),
            child: Text(
              'Latest Jobs',
              style: GoogleFonts.acme(
                fontSize: AppSizes.secondaryFontSize,
              ),
            ),
          ),
          Expanded(
            child: jobsProvider.loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: jobsProvider.jobs.length,
                    itemBuilder: (context, index) {
                      final job = jobsProvider.jobs[index];
                      return JobCard(
                        title: job['job_title'] ?? 'N/A',
                        company: job['recruiter']?['name'] ?? 'N/A',
                        location: job['location'] ?? 'N/A',
                        description: job['job_description'] ?? '',
                        workType: job['work_type'] ?? '',
                        workMode: job['work_mode'] ?? '',
                        deadline: job['application_deadline'] != null
                            ? DateFormat('yyyy-MM-dd').format(
                                DateTime.parse(job['application_deadline']))
                            : 'N/A',
                        status: job['status'] ?? '',
                      );
                    },
                  ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, AppSizes.largeGap * 5.5, 0),
            child: Text(
              'Companies You Will Find',
              style: GoogleFonts.acme(
                fontSize: AppSizes.secondaryFontSize,
              ),
            ),
          ),
          CompanyLogosSlider(),
        ],
      ),
    );
  }
}

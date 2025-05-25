import 'package:cgms/config/colors.dart';
import 'package:flutter/material.dart';
import '../jobs/job_list_screen.dart';
import '../cv_tools/cv_manager_screen.dart';
import '../profile/profile_screen.dart';
import '../settings/settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const JobListScreen(),
    const CVManagerScreen(),
    const SettingsScreen(),
    const ProfileScreen(),
  ];

  final List<BottomNavigationBarItem> _navItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.work), label: "Jobs"),
    BottomNavigationBarItem(icon: Icon(Icons.description), label: "CV Tools"),
    BottomNavigationBarItem(
        icon: Icon(Icons.add_chart_rounded), label: "Applications"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _navItems,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: AppColors.primaryIconColor,
        unselectedItemColor: AppColors.secondaryIconColor,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

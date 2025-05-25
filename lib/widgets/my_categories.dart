import 'package:flutter/material.dart';

import '../config/colors.dart';
import '../config/constants.dart';

// ignore: must_be_immutable
class MyCategories extends StatefulWidget {
  const MyCategories({super.key});

  @override
  State<MyCategories> createState() => _MyCategoriesState();
}

class _MyCategoriesState extends State<MyCategories> {
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.design_services, 'label': 'Design'},
    {'icon': Icons.shop, 'label': 'Sales'},
    {'icon': Icons.mic, 'label': 'Marketing'},
    {'icon': Icons.money, 'label': 'Finance'},
    {'icon': Icons.computer, 'label': 'Technology'},
    {'icon': Icons.code, 'label': 'Engineering'},
    {'icon': Icons.health_and_safety, 'label': 'Healthcare'},
    {'icon': Icons.business, 'label': 'Business'},
    {'icon': Icons.people, 'label': 'HR'},
    {'icon': Icons.local_shipping, 'label': 'Logistics'},
    {'icon': Icons.security, 'label': 'Security'},
    {'icon': Icons.build, 'label': 'Construction'},
  ];

  bool isClicked = false;

  int selectedIndex = -1;

  Color clickedColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppSizes.smallGap),
        // Horizontal Scrollable List of Categories
        GestureDetector(
          onTap: () {
            setState(() {
              clickedColor = AppColors.secondaryIconColor;
              isClicked = true;
            });
          },
          child: Container(
            decoration: const BoxDecoration(),
            height: AppSizes.largeGap*.9, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index; // Update the selected index
                    });
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppSizes.smallGap),
                    child: CategoryItem(
                      icon: categories[index]['icon']!,
                      label: categories[index]['label']!,
                      isSelected: selectedIndex ==
                          index, // Check if this item is selected
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: AppSizes.smallGap,
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;

  const CategoryItem(
      {super.key,
      required this.icon,
      required this.label,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes.largeGap * 3.5, // Adjust the width as needed
      decoration: BoxDecoration(
         border: Border.all(color: Colors.black, width: .5),
          // boxShadow: [
          //   BoxShadow(
          //     offset: Offset(0, 2),
          //     color: Colors.black.withOpacity(0.15),
          //     blurRadius: 5,
          //   ),
          // ],
          color: isSelected
              ? AppColors.primaryIconColor
              : Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(
              AppSizes.smallGap) // Adjust the opacity as needed
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Category Icon
          Icon(
            icon,
            size: AppSizes.smallIconSize*1.2,
            color: isSelected? Colors.white : AppColors.primaryIconColor,
          ),
          // SizedBox(height: AppSizes.smallGap), // Space between icon and text
          // Category Label
          Text(
            label,
            style: TextStyle(
              fontSize: AppSizes.tertiaryFontSize,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

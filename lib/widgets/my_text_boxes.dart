import 'package:flutter/material.dart';

import '../config/constants.dart';

class MyTextBox extends StatefulWidget {
  final String hintText; // Custom hint text as a parameter
  final Icon? icon; // Custom icon as a parameter
  final Icon? optionalIcon;
  final TextEditingController? controller; // Optional controller parameter
  final bool? obscureText;
  final VoidCallback? onIconTap;

  const MyTextBox({
    super.key,
    required this.hintText,
    this.icon,
    this.optionalIcon,
    this.controller,
    this.obscureText,
    this.onIconTap ,
  });

  @override
  State<MyTextBox> createState() => _MyTextBoxState();
}

class _MyTextBoxState extends State<MyTextBox> {
  late TextEditingController _controller; // Local controller

  @override
  void initState() {
    super.initState();
    // Use the passed controller if available, otherwise create a new one
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    // Dispose only if a new controller was created locally
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(AppSizes.largeGap, AppSizes.smallGap * 0.5,
          AppSizes.largeGap, AppSizes.smallGap * 0.5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.largeGap),
          color: Colors.white,
        ),
        child: TextField(
          controller: _controller, // Use the controller
          obscureText: widget.obscureText ?? false,
          onChanged: (value) {
            setState(() {
              // Update the input value (optional if controller is used externally)
            });
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            hintText: widget.hintText, // Use the hintText passed in
            prefixIcon: widget.icon, // Use the icon passed in
            suffixIcon: widget.optionalIcon != null
                ? GestureDetector(
                    onTap: widget.onIconTap,
                    child: widget.optionalIcon,
                  )
                : null,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 26, 46, 107),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../config/colors.dart';
import '../../config/constants.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text_boxes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _showPassword = false;

  final nameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  DateTime? selectedDate;
  bool loading = false;
  String? error;

  Future<void> handleRegister() async {
    setState(() {
      loading = true;
      error = null;
    });

    final success =
        await Provider.of<AuthProvider>(context, listen: false).register(
      name: nameController.text.trim(),
      username: usernameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text,
      birthDate: selectedDate != null
          ? DateFormat('yyyy-MM-dd').format(selectedDate!)
          : '',
    );

    setState(() => loading = false);

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Registration successful! Please login."),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, '/');
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Registration failed. Please try again."),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> pickBirthDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    height: AppSizes.largeGap * 11.55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.largeGap),
                      color: const Color.fromRGBO(247, 247, 247, 1),
                    ),
                    child: Image.asset("images/logo.png")),
                SizedBox(
                  height: AppSizes.smallGap,
                ),
                Text(
                  "Register",
                  style: GoogleFonts.acme(
                      fontSize: AppSizes.primaryFontSize * 1.2,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryIconColor),
                ),
                SizedBox(
                  height: AppSizes.smallGap * .5,
                ),
                MyTextBox(
                  hintText: "Full Name",
                  icon: const Icon(Icons.person),
                  controller: nameController,
                ),
                MyTextBox(
                  hintText: "Email Address",
                  icon: const Icon(Icons.email),
                  controller: emailController,
                ),
                MyTextBox(
                  hintText: "Username",
                  icon: const Icon(Icons.account_circle),
                  controller: usernameController,
                ),
                MyTextBox(
                  hintText: "Password",
                  icon: const Icon(Icons.lock),
                  controller: passwordController,
                  obscureText: !_showPassword,
                  optionalIcon: Icon(
                    _showPassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onIconTap: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                ),
                Center(
                  child: GestureDetector(
                    onTap: pickBirthDate,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      margin: const EdgeInsets.only(top: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F3F3),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.cake, color: Colors.indigo),
                          const SizedBox(width: 8),
                          Text(
                            selectedDate == null
                                ? "Select Birth Date"
                                : DateFormat('yyyy-MM-dd')
                                    .format(selectedDate!),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppSizes.smallGap,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  onPressed: loading ? null : handleRegister,
                  child: MyBytton(
                    height: AppSizes.largeGap * 1.5,
                    width: AppSizes.largeGap * 9.5,
                    btnName: "Register",
                  ),
                ),
                SizedBox(height: AppSizes.smallGap),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: GoogleFonts.acme(
                          fontSize: AppSizes.tertiaryFontSize,
                        ),
                      ),
                      SizedBox(
                        width: AppSizes.smallGap * .5,
                      ),
                      Text(
                        "Login",
                        style: GoogleFonts.acme(
                          fontSize: AppSizes.tertiaryFontSize,
                          color: AppColors.secondaryIconColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSizes.smallGap * 1.5,
                ),
              ],
            ),
          ),
          if (loading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}

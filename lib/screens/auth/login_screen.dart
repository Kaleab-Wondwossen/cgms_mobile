import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../config/colors.dart';
import '../../config/constants.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_text_boxes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _showPassword = false;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;
  String? error;

  void handleLogin() async {
    setState(() {
      loading = true;
      error = null;
    });

    final success = await Provider.of<AuthProvider>(context, listen: false)
        .login(usernameController.text, passwordController.text);

    setState(() => loading = false);

    if (!success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Login failed. Please check your credentials."),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      Navigator.pushReplacementNamed(context, "/dashboard");
    }
  }

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);

    return Scaffold(
      body: SingleChildScrollView(
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
              "Login",
              style: GoogleFonts.acme(
                  fontSize: AppSizes.primaryFontSize * 1.2,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryIconColor),
            ),
            SizedBox(
              height: AppSizes.smallGap * .5,
            ),
            Text(
              "Your Perfect Resume. Your Perfect Job.",
              style: GoogleFonts.acme(
                fontSize: AppSizes.tertiaryFontSize,
                color: const Color.fromARGB(255, 102, 102, 102),
              ),
            ),
            SizedBox(
              height: AppSizes.smallGap,
            ),
            SizedBox(
              height: AppSizes.smallGap,
            ),
            MyTextBox(
              hintText: "Enter Your Email Address",
              icon: const Icon(Icons.email),
              controller: usernameController,
            ),
            MyTextBox(
              hintText: "Enter Your Password",
              icon: const Icon(Icons.lock),
              optionalIcon: Icon(
                _showPassword ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onIconTap: () {
                setState(() {
                  _showPassword = !_showPassword; // ✅ this is a function
                });
              },
              controller: passwordController,
              obscureText: !_showPassword,
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
              onPressed: loading ? null : handleLogin,
              child: MyBytton(
                height: AppSizes.largeGap * 1.5,
                width: AppSizes.largeGap * 9.5,
                btnName: "Login",
              ),
            ),
            SizedBox(height: AppSizes.smallGap),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/register'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: GoogleFonts.acme(
                      fontSize: AppSizes.tertiaryFontSize,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: AppSizes.smallGap * .5,
                  ),
                  Text(
                    "Register",
                    style: GoogleFonts.acme(
                      fontSize: AppSizes.tertiaryFontSize,
                      color: AppColors.secondaryIconColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

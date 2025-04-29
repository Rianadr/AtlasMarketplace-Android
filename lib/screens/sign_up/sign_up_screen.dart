import 'package:flutter/material.dart';
import '../../constants.dart';
import '/services/auth_service.dart';
import 'components/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = "/sign_up";
  final AuthService authService; // Tambahkan authService di sini

  const SignUpScreen({Key? key, required this.authService}) : super(key: key); // Tambahkan authService ke konstruktor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text("Register Account", style: headingStyle),
                  const Text(
                    "Complete your details or continue \nwith social media",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  SignUpForm(authService: authService), // Tambahkan authService ke SignUpForm
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

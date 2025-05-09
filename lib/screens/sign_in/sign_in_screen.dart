import 'package:flutter/material.dart';
import '/services/auth_service.dart';
import 'components/sign_form.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = "/sign_in";
  final AuthService authService; // Tambahkan authService di sini

  const SignInScreen({Key? key, required this.authService}) : super(key: key); // Tambahkan authService ke konstruktor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
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
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Sign in with your email and password  \nor continue with social media",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  SignForm(authService: authService), // Tambahkan authService ke SignForm
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

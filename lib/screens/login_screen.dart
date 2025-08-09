import 'dart:convert';

import 'package:calley_app/screens/onboarding_screen.dart';
import 'package:calley_app/screens/signup_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../services/api_service.dart';
import '../utils/utils.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

String username = "demo";
String email = "demo@gmail.com";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController(text: "mks@gmail.com");
  final passwordController = TextEditingController(text: "123");

  bool isChecked = true;
  final _formKey = GlobalKey<FormState>();
  final apiService = ApiService();

  void _onLogin() async {
    final response = await apiService.logIn(
      emailController.text,
      passwordController.text,
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print(
        "loginResponse success: ${response.statusCode} - ${data["message"]}",
      );
      print("_id: ${data["user"]["_id"]}");
      print("username: ${data["user"]["username"]}");
      print("username: ${data["user"]["email"]}");

      setState(() {
        username = data["user"]["username"];
        email = data["user"]["email"];
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${data["message"]}"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    } else {
      print(
        "loginResponse error!!: ${response.statusCode} - ${data["message"]}",
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("${data["message"]}")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButton(
        name: "Sign In",
        btnFunction: () async {
          if (_formKey.currentState!.validate()) {
            _onLogin();
          }
        },
      ),

      body: Column(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              color: greyShadeColor,
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Transform.scale(
              scale: 0.9,
              child: Image(image: AssetImage("lib/assets/logo1.png")),
            ),
          ),

          Spacer(),

          const Text(
            'Welcome!',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Please sign-in to continue',
            style: TextStyle(color: Color(0xFF818181)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 15, 11),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  CustomTextfield(
                    labelText: "Email",
                    suffixIcon: Icons.email_outlined,
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
                      ).hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  CustomTextfield(
                    labelText: "Password",
                    suffixIcon: Icons.lock_outline,
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),

          Text("Forgot Password?"),
          SizedBox(height: 100),

          Spacer(),

          Container(
            child: RichText(
              text: TextSpan(
                text: 'Don\'t have an account? ',
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("clicked");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupScreen(),
                          ),
                        );
                      },
                    text: 'Sign Up',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

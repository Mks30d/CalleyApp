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
  final emailController = TextEditingController(text: "");
  final passwordController = TextEditingController(text: "");

  bool isChecked = true;
  final _formKey = GlobalKey<FormState>();
  final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyShadeColor,
      bottomNavigationBar: CustomButton(
        name: "Sign In",
        btnFunction: () async {
          if (_formKey.currentState!.validate()) {
            _onLogin();
          }
        },
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 130,
              width: MediaQuery.sizeOf(context).width*1,
              padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              decoration: BoxDecoration(
                color: secondaryColor,
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              child: Transform.scale(
                scale: 0.9,
                child: Center(child: Image(image: AssetImage("lib/assets/logo1.png"))),
              ),
            ),

            SizedBox(height: 22,),
        
            const Text(
              'Welcome!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Please sign-in to continue',
              style: TextStyle(color: Color(0xFF818181)),
            ),

            SizedBox(height: 22,),

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

            SizedBox(height: 11,),
            Text("Forgot Password?"),
            SizedBox(height: 8),

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
      ),
    );
  }

  // --------- _onLogin ----------
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
      //
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text("${data["message"]}"),
      //     backgroundColor: Colors.green,
      //   ),
      // );
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
}

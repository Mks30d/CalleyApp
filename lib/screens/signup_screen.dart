import 'dart:convert';

import 'package:calley_app/screens/login_screen.dart';
import 'package:calley_app/screens/otp_screen.dart';
import 'package:calley_app/utils/utils.dart';
import 'package:calley_app/widgets/custom_button.dart';
import 'package:calley_app/widgets/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../services/api_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

final mobileController = TextEditingController(text: "");
final emailController = TextEditingController(text: "");

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController(text: "");
  final passwordController = TextEditingController(text: "");
  final whatsappController = TextEditingController(text: "+91");
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyShadeColor,
      bottomNavigationBar: CustomButton(
        name: "Sign Up",
        btnFunction: () async {
          if (_formKey.currentState!.validate()) {
            if (!isChecked) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Please accept terms and conditions')),
              );
            } else {
              _onSignup();
              // print("Name: ${nameController.text}");
              // print("Email: ${emailController.text}");
              // print("Phone: ${mobileController.text}");
              // print("Password: ${passwordController.text}");
              // _formKey.currentState!.reset();
            }
          }
          ;
        },
      ),
      body: SingleChildScrollView(
        child: Column(
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
              'Please register to continue',
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
                      labelText: "Name",
                      suffixIcon: Icons.person_outline,
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
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
                    // CustomTextfield(
                    //   labelText: "",
                    //   suffixIcon: Icons.message_outlined,
                    //   controller: whatsappController,
                    //   focus: false,
                    //   // validator: (value) {
                    //   //   if (value == null || value.trim().isEmpty) {
                    //   //     return 'Enter phone number';
                    //   //   } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                    //   //     return 'Enter a valid 10-digit phone number';
                    //   //   }
                    //   //   return null;
                    //   // },
                    // ),
                    CustomTextfield(
                      labelText: "Mobile Number",
                      suffixIcon: Icons.phone_android_outlined,
                      controller: mobileController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter phone number';
                        } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                          return 'Enter a valid 10-digit phone number';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Spacer(),
                Transform.scale(
                  scale: 0.8,
                  child: Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                        print(isChecked);
                      });
                    },
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: 'I agree to the ',
                    style: Theme.of(context).textTheme.titleMedium,
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("clicked");
                          },
                        text: 'Terms and Conditions',
                        style: TextStyle(color: primaryColor),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(width: 19,),
                Spacer(),
              ],
            ),

            SizedBox(height: 5),

            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => OtpScreen()),
                );
              },
              child: Text(
                "Verify OTP",
                style: TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 5),

            RichText(
              text: TextSpan(
                text: 'Already have an account? ',
                style: Theme.of(context).textTheme.titleMedium,
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print("clicked");
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                    text: 'Sign In',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
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

  // --------- _onVerifyOtp ----------
  void _onSignup() async {
    final response = await apiService.signUp(
      nameController.text,
      emailController.text,
      passwordController.text,
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 201) {
      print(
        "signupResponse success: ${response.statusCode} - ${data["message"]}",
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${data["message"]}"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OtpScreen()),
      );
    } else {
      print(
        "signupResponse error!!: ${response.statusCode} - ${data["message"]}",
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("${data["message"]}")));
    }
    // _onGenerateOtp();
    apiService.onGenerateOtp(emailController.text, context);
  }
}

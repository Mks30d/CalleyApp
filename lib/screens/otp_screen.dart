import 'dart:convert';

import 'package:calley_app/screens/login_screen.dart';
import 'package:calley_app/screens/onboarding_screen.dart';
import 'package:calley_app/screens/signup_screen.dart';
import 'package:calley_app/services/api_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyShadeColor,
      // appBar: AppBar(backgroundColor: secondaryColor),
      bottomNavigationBar: CustomButton(
        name: "Verify",
        btnFunction: () {
          if (_formKey.currentState!.validate()) {
            _onVerifyOtp();
          }
        },
      ),
      body: Column(
        children: [
          Container(
            height: 130,
            width: MediaQuery.sizeOf(context).width * 1,
            padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
            decoration: BoxDecoration(
              color: secondaryColor,
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            child: Transform.scale(
              scale: 0.9,
              child: Center(
                child: Image(image: AssetImage("lib/assets/logo1.png")),
              ),
            ),
          ),

          Spacer(),
          const Text(
            'Email OTP Verification',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 11),

          const Text(
            'Please ensure that the email id mentioned is valid',
            style: TextStyle(color: Color(0xFF818181)),
          ),
          const Text(
            'as we have sent an OTP to your email.',
            style: TextStyle(color: Color(0xFF818181)),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 15, 0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  CustomTextfield(
                    labelText: "Enter OTP",
                    suffixIcon: Icons.dialpad_outlined,
                    controller: otpController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter OTP';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emailController.text, style: TextStyle(fontSize: 15)),
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
                icon: Text("Edit", style: TextStyle(color: primaryColor)),
              ),
            ],
          ),
          SizedBox(height: 80),
          Spacer(),
          RichText(
            text: TextSpan(
              text: 'Didn\'t receive OTP code?',
              style: Theme.of(context).textTheme.titleMedium,
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      print("clicked");
                      apiService.onGenerateOtp(emailController.text, context);
                    },
                  text: ' Resend OTP',
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
    );
  }

  // --------- _onVerifyOtp ----------
  void _onVerifyOtp() async {
    final response = await apiService.verifyOtp(
      emailController.text,
      otpController.text,
    );
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print(
        "VerifyOtpResponse success: ${response.statusCode} - ${data["message"]}",
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${data["message"]}"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      print(
        "VerifyOtpResponse error!!: ${response.statusCode} - ${data["message"]}",
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("${data["message"]}")));
    }
  }
}

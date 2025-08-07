import 'package:calley_app/screens/signup_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: CustomButton(
        name: "Verify",
        btnFunction: () {
          // if (_formKey.currentState!.validate()) {
          //   if (true) {
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       SnackBar(content: Text('Please accept terms and conditions')),
          //     );
          //   } else {
          //     print("Password: ${passwordController.text}");
          //     _formKey.currentState!.reset();
          //   }
          // };
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
            'Whatsapp OTP',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Verification',
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
            padding: const EdgeInsets.fromLTRB(15, 8, 15, 11),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  CustomTextfield(
                    labelText: "Enter OTP",
                    suffixIcon: Icons.lock_outline,
                    controller: otpController,
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
          Text(mobileController.text),
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
}

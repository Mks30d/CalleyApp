import 'package:calley_app/widgets/custom_button.dart';
import 'package:calley_app/widgets/custom_ui.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: customCallingNavBar(
        MediaQuery.of(context).size.width * .7, () {},
      ),
      body: Column(
        children: [
          profileCard("Hello Swati", "Calley Personal"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                color: tertiaryColor,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(height: 11),
                      Text(
                        "If you are here for the first time then ensure that",
                        style: TextStyle(color: whiteShadeColor),
                      ),
                      Text(
                        "you have uploaded the list to call from calley Web",
                        style: TextStyle(color: whiteShadeColor),
                      ),
                      Text(
                        "Panel hosted on https://app.getcalley.com",
                        style: TextStyle(color: whiteShadeColor),
                      ),
                    ],
                  ),

                  Container(
                    height: 220,
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(22),
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

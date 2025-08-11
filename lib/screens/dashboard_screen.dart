import 'dart:convert';

import 'package:calley_app/screens/graph_screen.dart';
import 'package:calley_app/screens/login_screen.dart';
import 'package:calley_app/widgets/custom_bottom_navbar.dart';
import 'package:calley_app/widgets/custom_drawer.dart';
import 'package:calley_app/widgets/custom_ui.dart';
import 'package:calley_app/widgets/show_calling_List_modal.dart';
import 'package:flutter/material.dart';

import '../services/api_service.dart';
import '../utils/utils.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text("Dashboard"),
        actions: [
          Icon(Icons.headset_mic_outlined),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Icon(Icons.notifications_on_outlined),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      bottomNavigationBar: CustomBottomNavBar(),
      body: Column(
        children: [
          profileCard("Hello $username", "Welcome to Calley!"),

          Spacer(),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 360,
              width: MediaQuery.of(context).size.width * 1,
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
                        "LOAD NUMBER TO CALL",
                        style: TextStyle(
                          color: whiteShadeColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Container(
                    height: 315,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(height: 15),
                            Text(
                              "Visit https://app.getcalley.com to upload",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              "numbers that you wish to call using Calley",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              "Mobile App.",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                              image: AssetImage("lib/assets/image1.png"),
                              width: 250,
                            ),
                            SizedBox(width: 1),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Spacer(),

          // star calling now
          customCallingNavBar(MediaQuery.of(context).size.width * .7, () {
            showCallingListModal(context);
          }),
        ],
      ),
    );
  }
}

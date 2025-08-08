import 'package:flutter/material.dart';

import '../utils/utils.dart';

Widget profileCard(String title, String subtitle) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: ListTile(
      tileColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: EdgeInsets.fromLTRB(20, 8, 11, 8),
      title: Text(
        title,
        style: TextStyle(color: whiteShadeColor, fontSize: 12),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: whiteShadeColor,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Image(
        image: AssetImage("lib/assets/profile.png"),
        width: 45,
      ),
    ),
  );
}

///////////////////////////////////////////////////////

Widget customCallingNavBar(double width, Function() btnFunction) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(11, 8, 11, 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {},
          icon: Image(
            image: AssetImage("lib/assets/image2.png"),
            width: 25,
          ),
          style: IconButton.styleFrom(
            backgroundColor: Color(0xff4cae50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        // CustomButton(name: "Star Calling Now"),
        ElevatedButton(
          onPressed: btnFunction,
          child: Text("Star Calling Now"),
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            foregroundColor: whiteShadeColor,
            fixedSize: Size(width, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    ),
  );
}
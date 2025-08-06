import 'package:calley_app/utils/utils.dart';
import 'package:flutter/material.dart';

Widget CustomButton(String name, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(22, 11, 22, 25),
    child: ElevatedButton(
      onPressed: () {},
      child: Text(name),
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: whiteShadeColor,
        fixedSize: Size(MediaQuery.of(context).size.width, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
  );
}

import 'package:calley_app/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String name;
  final Function()? btnFunction;

  const CustomButton({super.key, required this.name, this.btnFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 11, 22, 25),
      child: ElevatedButton(
        onPressed: btnFunction,
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
}

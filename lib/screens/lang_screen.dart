import 'package:calley_app/utils/utils.dart';
import 'package:calley_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LangScreen extends StatefulWidget {
  const LangScreen({super.key});

  @override
  State<LangScreen> createState() => _LangScreenState();
}

class _LangScreenState extends State<LangScreen> {
  final List<String> languages = [
    'English',
    'Hindi',
    'Bengali',
    'Kannada',
    'Punjabi',
    'Tamil',
    'Telugu',
    'French',
    'Spanish',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyShadeColor,
      appBar: AppBar(
        title: Text('Choose Your Language', style: TextStyle(fontSize: 20)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: languages.length,
          itemBuilder: (context, index) {
            final isSelected = index == selectedIndex;

            return ListTile(
              title: Text(
                languages[index],
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.blue : Colors.black,
                ),
              ),
              trailing: isSelected
                  ? Icon(Icons.radio_button_checked, color: Colors.blue)
                  : Icon(Icons.radio_button_unchecked, color: Colors.black),
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
            );
          },
        ),
      ),

      bottomNavigationBar: CustomButton("Select", context),
    );
  }
}

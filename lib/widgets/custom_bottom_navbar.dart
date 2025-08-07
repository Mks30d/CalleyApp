import 'package:calley_app/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 2;

  final List<IconData> _icons = [
    Icons.home_outlined,
    Icons.assignment_outlined,
    Icons.play_arrow, // Center icon
    Icons.phone_callback_outlined,
    Icons.edit_calendar_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        border: Border(top: BorderSide(color: primaryColor, width: 1)),
      ),
      child: Center(
        child: ListView.builder(
          itemCount: _icons.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 5),
          itemBuilder: (context, index) {
            final isCenter = index == 2;
            final isSelected = _selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Container(
                  padding: isCenter ? EdgeInsets.all(8) : EdgeInsets.all(5),
                  decoration: isCenter
                      ? BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        )
                      : null,
                  child: Icon(
                    _icons[index],
                    size: 24,
                    color: isCenter
                        ? Colors.white
                        : isSelected
                        ? Colors.blue
                        : Colors.black,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

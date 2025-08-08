import 'package:calley_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class GraphScreen extends StatelessWidget {
  final dynamic jsonData;

  const GraphScreen({super.key, required this.jsonData});

  @override
  Widget build(BuildContext context) {
    String length = jsonData != null
        ? jsonData["calls"].length.toString()
        : "0";
    String pending = jsonData != null ? jsonData["pending"].toString() : "0";
    String called = jsonData != null ? jsonData["called"].toString() : "0";
    String rescheduled = jsonData != null
        ? jsonData["rescheduled"].toString()
        : "0";
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: CustomButton(name: "Star Calling Now",btnFunction: () {

      },),
      body: Column(
        children: [
          Text("length: $length"),
          Text("pending: $pending"),
          Text("called: $called"),
          Text("rescheduled: $rescheduled"),
        ],
      ),
    );
  }
}

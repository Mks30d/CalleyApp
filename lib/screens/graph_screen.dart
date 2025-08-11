import 'package:calley_app/widgets/custom_button.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import '../widgets/custom_drawer.dart';

class GraphScreen extends StatelessWidget {
  final dynamic jsonData;

  const GraphScreen({super.key, required this.jsonData});

  @override
  Widget build(BuildContext context) {
    int length = jsonData != null ? jsonData["calls"].length : 50;
    int pending = jsonData != null ? jsonData["pending"] : 27;
    int called = jsonData != null ? jsonData["called"] : 23;
    int rescheduled = jsonData != null ? jsonData["rescheduled"] : 11;
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
      bottomNavigationBar: CustomButton(
        name: "Star Calling Now",
        btnFunction: () {},
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text("length: $length"),
          // Text("pending: $pending"),
          // Text("called: $called"),
          // Text("rescheduled: $rescheduled"),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListTile(
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding: EdgeInsets.fromLTRB(20, 8, 11, 8),
              title: Text(
                "Test List",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              subtitle: Text(
                "$length CALLS",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Container(
                height: 50,
                width: 55,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Center(
                  child: Text(
                    "S",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(),

          Center(
            child: Container(
              height: 210,
              width: 210,
              child: PieChart(
                PieChartData(
                  sectionsSpace: 5,
                  // centerSpaceRadius: 40,
                  sections: [
                    PieChartSectionData(
                      showTitle: false,
                      value: called + 0,
                      radius: 28,
                      color: Color(0xff0eae1c),
                    ),
                    PieChartSectionData(
                      showTitle: false,
                      value: rescheduled + 0,
                      radius: 38,
                      color: Color(0xff9466F0),
                    ),
                    PieChartSectionData(
                      showTitle: false,
                      value: pending + 0,
                      radius: 28,
                      color: Color(0xffF7A93C),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 80,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _colorCard(pending, "Pending", 0xffF7A93C, 0xffFBEDDA, context),
              _colorCard(called, "Done", 0xff0eae1c, 0xffDCF9DE, context),
              _colorCard(
                rescheduled,
                "Scheduled",
                0xff9466F0,
                0xffeae0ff,
                context,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // --------- _colorCard ----------
  Widget _colorCard(
    int value,
    String name,
    int primaryColor,
    int secColor,
    BuildContext context,
  ) {
    return Container(
      height: 70,
      width: MediaQuery.sizeOf(context).width * 0.3,
      decoration: BoxDecoration(
        color: Color(secColor),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            child: Container(
              height: 45,
              width: 3,
              decoration: BoxDecoration(
                color: Color(primaryColor),
                borderRadius: BorderRadius.circular(11),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name),
              Text(
                "$value calls",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

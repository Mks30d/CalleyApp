import 'package:calley_app/screens/graph_screen.dart';
import 'package:calley_app/utils/utils.dart';
import 'package:flutter/material.dart';

import '../services/api_service.dart';

final apiService = ApiService();

void showCallingListModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          // height: 500,
          decoration: BoxDecoration(
            color: tertiaryColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // this adjust height to min
            children: [
              Padding(
                padding: const EdgeInsets.all(11.0),
                child: Text(
                  "CALLING LISTS",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 24),
                    // Select & Refresh row
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 5,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Calling List",
                            style: TextStyle(fontSize: 16),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              padding: EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            icon: Icon(
                              Icons.sync,
                              size: 25,
                              color: whiteShadeColor,
                            ),
                            label: Text(
                              "Refresh",
                              style: TextStyle(color: whiteShadeColor),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 12),

                    // Test List item
                    GestureDetector(
                      onTap: () => apiService.onFetchListDetails(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Test List", style: TextStyle(fontSize: 16)),
                            Icon(Icons.arrow_circle_right_outlined, size: 25),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

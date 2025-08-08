import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../screens/graph_screen.dart';

const String baseUrl = 'https://mock-api.calleyacd.com/api';

// https://mock-api.calleyacd.com/api/auth/register
// https://mock-api.calleyacd.com/api/auth/login
// https://mock-api.calleyacd.com/api/auth/send-otp
// https://mock-api.calleyacd.com/api/auth/verify-otp
// https://mock-api.calleyacd.com/api/list/68626fb697757cb741f449b9
// https://mock-api.calleyacd.com/api/list?userId=68626f9497757cb741f449b0

class ApiService {
  // -------- User signup --------
  Future<http.Response> signUp(
    String name,
    String email,
    String password,
  ) async {
    final uri = Uri.parse('$baseUrl/auth/register');
    final response = http.post(
      uri,
      body: json.encode({
        'username': name,
        'email': email,
        'password': password,
      }),
      headers: {'Content-Type': 'application/json'},
    );
    return response;
  }

  // -------- Generate OTP --------
  Future<http.Response> generateOtp(String email) {
    final uri = Uri.parse("$baseUrl/auth/send-otp");
    final response = http.post(
      uri,
      body: json.encode({'email': email}),
      headers: {'Content-Type': 'application/json'},
    );
    return response;
  }

  // calling Generate OTP
  void onGenerateOtp(String email, BuildContext context) async {
    final response = await generateOtp(email);
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print(
        "generateOtpResponse success: ${response.statusCode} - ${data["message"]}",
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${data["message"]}"),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      print(
        "generateOtpResponse error!!: ${response.statusCode} - ${data["message"]}",
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("${data["message"]}")));
    }
  }

  // -------- Verify OTP --------
  Future<http.Response> verifyOtp(String email, String otp) {
    final uri = Uri.parse("$baseUrl/auth/verify-otp");
    final response = http.post(
      uri,
      body: json.encode({'email': email, 'otp': otp}),
      headers: {'Content-Type': 'application/json'},
    );
    return response;
  }

  // -------- Fetch user data --------
  Future<http.Response> fetchUserData(String email) {
    final uri = Uri.parse("$baseUrl/list/6895978dbe6f7a0dd5225b9f");
    final response = http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );
    return response;
  }

  // -------- onFetchUserData --------
  void onFetchUserData(BuildContext context) async {
    final response = await fetchUserData("univrsa.help@gmail.com");
    debugPrint("response.statusCode: ${response.statusCode.toString()}");
    var jsonData = null;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GraphScreen(jsonData: jsonData)),
    );
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      // print("jsonData: ${jsonData}");
      // print("jsonData: ${jsonData["calls"][0]}");
      print("jsonData length: ${jsonData["calls"].length}");
      print("jsonData pending: ${jsonData["pending"]}");
      print("jsonData called: ${jsonData["called"]}");
      print("jsonData rescheduled: ${jsonData["rescheduled"]}");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("200"), backgroundColor: Colors.green),
      );
    } else {
      print("VerifyOtpResponse error!!: ${response.statusCode}}");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("${response.statusCode}")));
    }
  }

  // --------  --------
  // Future<List<PostsModel>> getPostApi() async {
  //   final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
  //   final response = await http.get(uri);
  //   var data = jsonDecode(response.body.toString());
  //   if (response.statusCode == 200) {
  //     for (Map i in data) {
  //       postList.add(PostsModel.fromJson(i));
  //     }
  //     return postList;
  //   }
  //   return postList;
  // }
}

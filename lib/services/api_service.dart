import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = 'https://mock-api.calleyacd.com/api';

// https://mock-api.calleyacd.com/api/auth/register
// https://mock-api.calleyacd.com/api/auth/login
// https://mock-api.calleyacd.com/api/auth/send-otp
// https://mock-api.calleyacd.com/api/auth/verify-otp
// https://mock-api.calleyacd.com/api/list/68626fb697757cb741f449b9
// https://mock-api.calleyacd.com/api/list?userId=68626f9497757cb741f449b0

class ApiService {
  // User signup
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

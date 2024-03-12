// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class ApiService {
//   Future<dynamic> loginUrl(String username, String password) async {
//     final response = await http.post(
//       Uri.parse('https://cms.istad.co/api/auth/local'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({'identifier': username, 'password': password}),
//     );
//
//     if (response.statusCode == 200) {
//       // Successful login
//       return true;
//     } else {
//       // Login failed
//       throw Exception('Failed to login');
//     }
//   }
// }
abstract class BaseApiService{
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
}
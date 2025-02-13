import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Map<String, dynamic>> getStatus() async {
    final response = await http.get(Uri.http('40.90.224.241:5000', '/isLoggedIn'));

    if (response.statusCode < 400) {
      final Map<String, dynamic> responseBodyAsMap = jsonDecode(response.body);

      return {
        'isLoggedIn': responseBodyAsMap['isLoggedIn'] ?? false,
        'userName': responseBodyAsMap['user']?['userName'] ?? 'Unknown',
        'csrfToken': responseBodyAsMap['csrfToken'] ?? '',
      };
    }

    throw Exception('Response Code: ${response.statusCode} - ${response.body}');
  }
}




// api_service.dart
import 'dart:convert';
import 'data_model.dart';

import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<MyData>> fetchData() async {

    final Uri apiUrl = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    final response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => MyData.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}

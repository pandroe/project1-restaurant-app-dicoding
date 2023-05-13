import 'package:dio/dio.dart';

Future<String> fetchJsonData() async {
  try {
    final response = await Dio().get(
        'https://raw.githubusercontent.com/dicodingacademy/assets/main/flutter_fundamental_academy/local_restaurant.json');
    return response.data;
  } catch (e) {
    throw Exception('Failed to load JSON data');
  }
}

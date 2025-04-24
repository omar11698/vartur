import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vartur_assignment/data/response_model.dart';
  

Future<List<ImageFromApi>> getImages() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    List<ImageFromApi> images = data.map((image) => ImageFromApi.fromMap(image)).toList();
    return images;
  } else {
    throw Exception('Failed to load images');
  }
}

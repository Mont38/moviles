import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/popular_model.dart';

class ApiPopular {
  final URL =
      "https://api.themoviedb.org/3/movie/popular?api_key=6eab5ff1847aa317ae3b6f7d8a0d34d7&language=es-MX&page=1";
  Future<List<PopularModel>?> getAllPopular() async {
    final response = await http.get(Uri.parse(URL));
    if (response.statusCode == 200) {
      var popular = jsonDecode(response.body)['results'] as List;
      var listPopular =
          popular.map((video) => PopularModel.fromMap(video)).toList();
      return listPopular;
    }
    return null;
  }
}

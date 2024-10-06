import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_jobs/config/api.dart';
import 'package:flutter_jobs/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryProvider with ChangeNotifier {
  Future<List<CategoryModel>> getCategories() async {
    try {
      var url = '${Api.baseUrl}categories';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Decode JSON dan mapping ke dalam list of CategoryModel
        List data = jsonDecode(response.body);
        List<CategoryModel> categories =
            data.map((item) => CategoryModel.fromJson(item)).toList();
        return categories;
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}

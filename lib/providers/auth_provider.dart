import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_jobs/config/api.dart';
import 'package:flutter_jobs/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  Future<Map<String, dynamic>> register(
      String email, String password, String name, String goal) async {
    try {
      var body = {
        'email': email,
        'password': password,
        'name': name,
        'goal': goal,
      };
      var url = '${Api.baseUrl}register';
      var response = await http.post(
        Uri.parse(url),
        // headers: {
        //   'Content-Type': 'application/json',
        // },
        body: body,
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return {
          'statusCode': 200,
          'user': UserModel.fromJson(data),
        };
      } else {
        return {
          'statusCode': response.statusCode,
          'message':
              jsonDecode(response.body)['error'] ?? "Something went wrong",
          'url': url
        };
      }
    } catch (e) {
      print(e);
      return {
        'statusCode': 500,
        'message': "Something went wrong",
      };
    }
  }

  Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    try {
      var body = {
        'email': email,
        'password': password,
      };
      var url = '${Api.baseUrl}login';
      var response = await http.post(
        Uri.parse(url),
        // headers: {
        //   'Content-Type': 'application/json',
        // },
        body: body,
      );
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return {
          'statusCode': 200,
          'user': UserModel.fromJson(data),
        };
      } else {
        return {
          'statusCode': response.statusCode,
          'message':
              jsonDecode(response.body)['error'] ?? "Something went wrong",
          'url': url
        };
      }
    } catch (e) {
      print(e);
      return {
        'statusCode': 500,
        'message': "Something went wrong",
      };
    }
  }
}

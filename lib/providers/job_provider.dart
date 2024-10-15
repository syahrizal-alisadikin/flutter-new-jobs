import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_jobs/config/api.dart';
import 'package:flutter_jobs/models/job_model.dart';
import 'package:http/http.dart' as http;

class JobProvider with ChangeNotifier {
  Future<List<JobModel>> getJobs() async {
    try {
      var url = '${Api.baseUrl}jobs';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<JobModel> jobs = [];
        List parsedJson = jsonDecode(response.body);
        parsedJson.forEach((job) {
          jobs.add(JobModel.fromJson(job));
        });
        return jobs;
      } else {
        return [];

        // throw Exception('Failed to load categories');
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<JobModel>> getJobsByCategories(String category) async {
    try {
      var url = '${Api.baseUrl}jobs?category=$category';
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<JobModel> jobs = [];
        List parsedJson = jsonDecode(response.body);
        parsedJson.forEach((job) {
          jobs.add(JobModel.fromJson(job));
        });
        return jobs;
      } else {
        return [];

        // throw Exception('Failed to load categories');
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}

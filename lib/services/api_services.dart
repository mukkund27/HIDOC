import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import '../Model/all_data_model.dart';

class ApiService {
  static Future getAlldata() async {
    String baseurl =
        "http://devapi.hidoc.co:8080/HidocWebApp/api/getArticlesByUid";
    try {
      http.Response response = await http.post(
        Uri.parse(baseurl),
        body: {'sId': '500', 'userId': '423914'},
      );
      if (kDebugMode) {
        print(baseurl);
        log(response.body);
        print(response.statusCode);
      }
      if (response.statusCode == 200) {
        return AllDataModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      if (kDebugMode) {
        print('user all Data err --- >: ${e.toString()}');
      }
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'error/exceptions.dart';

class BaseHttpClient {
  static const String _baseUrl = "https://arfudy-backend.onrender.com";

  static Future<Map<String, dynamic>> getAsync<T>(String routeName) async {
    try {
      final String url = _baseUrl + routeName;
      Response response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      if (response.statusCode != 200) {
        throw GetBadRequisitionException(
            StackTrace.current, 'BadRequisition.GET: Status Code = ${response.statusCode}');
      }
      final codeUnits = response.body.codeUnits;
      final data = utf8.decode(codeUnits);
      debugPrint(data);
      final Map<String, dynamic> result = json.decode(data);
      return result;
    } catch (exception, stacktrace) {
      throw GetBadRequisitionException(stacktrace, 'BadRequisition.GET');
    }
  }
}

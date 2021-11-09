import 'dart:async';

import 'package:dio/dio.dart';

class DioHelper {
  static var client = Dio();

  static Future<dynamic> fetchCategories() async {
    String theUrl = 'https://fakestoreapi.com/products/categories';
    try {
      Response response = await client
          .get(theUrl,
              options: Options(headers: {'Content-Type': 'application/json'}))
          .timeout(const Duration(seconds: 30));
      dynamic json = response.data;
      if (response.statusCode == 200) {
        return json;
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      return null;
    }
  }

  static Future<dynamic> fetchProducts() async {
    String theUrl = 'https://fakestoreapi.com/products';
    try {
      Response response = await client
          .get(theUrl,
              options: Options(headers: {'Content-Type': 'application/json'}))
          .timeout(const Duration(seconds: 30));
      dynamic json = response.data;
      if (response.statusCode == 200) {
        return json;
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      return null;
    }
  }
}

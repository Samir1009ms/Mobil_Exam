import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/endpoints.dart';
import 'package:flutter_application_1/data/model/home_model.dart';

class HomeApiService {
  static Future<List<HomeModel>> getProducts() async {
    final dio = Dio();
    try {
      final endpoint = Endpoints.product();
      final response = await dio.get(endpoint);
      final List data = response.data;

      if (response.statusCode == 200) {
        return data.map((e) => HomeModel.fromJson(e)).toList();
      }
      throw Exception();
    } on SocketException catch (e) {
      throw SocketException("$e");
    } catch (e) {
      throw Exception();
    }
  }
}

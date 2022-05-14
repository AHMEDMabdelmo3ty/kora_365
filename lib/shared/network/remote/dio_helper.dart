// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.football-data.org/v2',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String Url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? auth,
  }) async {
    dio.options.headers = {
      'X-Auth-Token': 'ca403ed0bfa04322a2b44885a7003932'
    };
    return await dio.get(
      Url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String Url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? auth,
  }) async {
    dio.options.headers = {
      'X-Auth-Token': 'ca403ed0bfa04322a2b44885a7003932'
    };
    return dio.post(Url, queryParameters: query, data: data);
  }
}

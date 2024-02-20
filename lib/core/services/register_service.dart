import 'dart:convert';

import 'package:BolilerPlate/config/app_constant.dart';
import 'package:BolilerPlate/config/urls/app_urls.dart';
import 'package:BolilerPlate/config/urls/global_configuration.dart';
import 'package:dio/dio.dart';

class RegisterService {
  final dio = Dio();

   Future register(
      {required String email,
      required String password}) async {
    final body = {
      'email': email,
      'password': password
    };

    try {
      final response = await dio.post(
          GlobalConfiguration.baseUrl + AppUrls.register,
          data: jsonEncode(body));
      if (response.data != null && response.statusCode == 201) {
        return response.data;
      } else {
        return response.data;
      }
    } catch (error) {
      return AppConstants.DOUBEL_EMAIL;
    }
  }
}

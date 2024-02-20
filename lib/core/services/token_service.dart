import 'dart:convert';
import 'dart:io';
import 'package:BolilerPlate/config/app_constant.dart';
import 'package:BolilerPlate/config/statics/statics.dart';
import 'package:BolilerPlate/config/urls/app_urls.dart';
import 'package:BolilerPlate/config/urls/global_configuration.dart';
import 'package:BolilerPlate/core/helpers/local_storage.dart';
import 'package:BolilerPlate/core/helpers/requests_interceptor.dart';
import 'package:dio/dio.dart';

import 'package:get/get.dart' as getX;

class TokenService {
  LocalStorageController localStorageController = getX.Get.find();
  Future<bool> refreshTokens() {
    final String basicAuth = 'Bearer ${Statics.loggedUser?.token}';

    final data = {
      'Refresh-token': Statics.loggedUser?.refreshToken,
      HttpHeaders.authorizationHeader: basicAuth,
      HttpHeaders.contentTypeHeader: '*/*',
    };

    try {
      return DioRequestsInterceptor.dio
          .request(GlobalConfiguration.baseUrl + AppUrls.tokenRefresh,
              options: Options(method: "POST", headers: data))
          .then((response) async {
        if (response.data != null && response.statusCode == 200) {
          Statics.loggedUser?.token = response.data['accessToken'].toString();
          Statics.loggedUser?.refreshToken =
              response.data['refreshToken'].toString();
          await localStorageController.saveObjectToStorage(
              AppConstants.USER, json.encode(Statics.loggedUser!.toMap()).toString());
          return true;
        } else {
          return false;
        }
      });
    } on DioError {
      return Future.value(false); // or handler.reject(error);
    }
  }
}

import 'dart:convert';

import 'package:BolilerPlate/config/statics/statics.dart';
import 'package:BolilerPlate/config/urls/app_urls.dart';
import 'package:BolilerPlate/core/models/user_model.dart';
import 'package:dio/dio.dart';

import '../../config/urls/global_configuration.dart';

class UserService {
    final dio = Dio();

  Future<bool> signIn({required String email, required String password}) async{
    final body = {'email': email, 'password': password};
    return await dio
        .post(GlobalConfiguration.baseUrl + AppUrls.login,
            data: jsonEncode(body))
        .then((Response<dynamic> response) {
      if (response.data != null && response.statusCode == 200) {
        
      final userResponse =
            UserModel.fromJson(response.data as Map<String, dynamic>);

      Statics.saveLoggedUserToken(userModel: userResponse);
      Statics.loggedUser = userResponse;
        return true;
      } else if(response.statusCode == 401) {
        return false;
      } else {
        return false;

      }
    });
  }
}

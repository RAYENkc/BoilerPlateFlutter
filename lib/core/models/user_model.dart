import 'package:BolilerPlate/config/statics/statics.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
  String userUuid = "";
  String email = "";
  String token = "";
  String refreshToken = "";
  late int _age;
  String userFullName = "";
  late Dio _dio;

  UserModel(this.userUuid, this.email, this.token, this.refreshToken,
      this.userFullName, this._age, this._dio);

  UserModel.fromJson(Map<String, dynamic> json) {
    userUuid = json['userUuid'] ?? "";
    email = json['userEmail'] ?? "";
    token = json['accessToken'] ?? Statics.loggedUser?.token ?? "";
    refreshToken =
        json['refreshToken'] ?? Statics.loggedUser?.refreshToken ?? "";
    userFullName = json['userFullName'] ?? "";
  }

  bool get isOld => _age > 24;
  int get age => _age;

  void birthday() {
    Dio().get("google.com");
    _age++;
    notifyListeners();
  }

  void changeName(String newName) {
    email = newName;
    notifyListeners();
  }

  Map<String, dynamic> toMap() => {
        "userUuid": userUuid,
        "username": email,
        "token": token,
        "refreshToken": refreshToken,
        "userFullName": userFullName
      };
}

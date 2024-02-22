
import 'package:BolilerPlate/config/statics/statics.dart';
import 'package:flutter/cupertino.dart';


class UserModel {
  @required
  String userUuid = "";
  @required
  String email = "";
  @required
  String token = "";
  @required
  String refreshToken = "";
  @required
  String userFullName = "";

  UserModel(this.userUuid, this.email, this.token, this.refreshToken,
      this.userFullName);

  
  UserModel.fromJson(Map<String, dynamic> json) {
    userUuid = json['userUuid'] ?? "";
    email = json['userEmail'] ?? "";
    token = json['accessToken'] ?? Statics.loggedUser?.token ?? "";
    refreshToken =
        json['refreshToken'] ?? Statics.loggedUser?.refreshToken ?? "";
    userFullName = json['userFullName'] ?? "";
  }
    Map<String, dynamic> toMap() => {
        "userUuid": userUuid,
        "username": email,
        "token": token,
        "refreshToken": refreshToken,
        "userFullName": userFullName
       
      };
}
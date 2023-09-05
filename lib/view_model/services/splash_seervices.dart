import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/repository/user_view_model.dart';
import 'package:mvvm/utills/routes/route_name.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthnetication(BuildContext context) async {
    getUserData().then((value) async {
      if (value.token == null || value.token == ' ') {
        Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, Routesname.login);
      } else {
        Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, Routesname.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}

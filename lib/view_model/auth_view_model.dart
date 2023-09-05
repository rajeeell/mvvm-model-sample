import 'package:flutter/material.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utills/routes/route_name.dart';
import 'package:mvvm/utills/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myrepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSinguploading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  final _myRepo = AuthRepository();
  Future<void> loginAPi(dynamic data, BuildContext context) async {
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.FlushbarErrorMessage('Login successful', context);
      Navigator.pushNamed(context, Routesname.home);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.FlushbarErrorMessage(error.toString(), context);
    });
  }
    Future<void> signUpApi(dynamic data, BuildContext context) async {
      setSinguploading(true);

      _myRepo.signupApi(data).then((value) {
        setSinguploading(false);
        Utils.FlushbarErrorMessage('Sign up successfull', context);
        Navigator.pushNamed(context, Routesname.home);
      }).onError((error, stackTrace) {
        setSinguploading(false);
        Utils.FlushbarErrorMessage(error.toString(), context);
      });
    }
  }


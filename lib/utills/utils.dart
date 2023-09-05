import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static void fieldFocusChange(
    BuildContext context,
    FocusNode current,
    FocusNode nextFocus,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void FlushbarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(15),
        message: message,
        duration: Duration(seconds: 10),
        flushbarPosition: FlushbarPosition.BOTTOM,
        backgroundColor: Colors.black,
        reverseAnimationCurve: Curves.bounceIn,
        positionOffset: 20,
        icon: Icon(
          Icons.error,
          size: 18,
          color: Colors.black,
        ),
      )..show(context),
    );
  }

  static snaccBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.blue, content: Text(message)));
  }
}

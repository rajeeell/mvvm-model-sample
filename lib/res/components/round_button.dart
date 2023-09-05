import 'package:flutter/material.dart';
import 'package:mvvm/res/color.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 200,
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: 40,
          width: 200,
          decoration: BoxDecoration(
            color: Appcolor.buttonColor,
          ),
          child: Center(
              child: loading
                  ? CircularProgressIndicator(color: Colors.white,)
                  : Text(
                      title,
                      style: TextStyle(color: Appcolor.white),
                    )),
        ),
      ),
    );
  }
}

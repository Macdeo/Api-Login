import 'package:flutter/material.dart';
import 'package:wisdom_show/colors/constants.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccount({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text(
        login ? "Don't have an Account ? " : "Already have an Account ?", style: TextStyle(color: kSecondColor)),
      GestureDetector(
          onTap: press,
          child: Text(
            login ?"Sign Up" : "Sign In",
            style: TextStyle(color: kSecondColor, fontWeight: FontWeight.bold),
          ))
    ]);
  }
}

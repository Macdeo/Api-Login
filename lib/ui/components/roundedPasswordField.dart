import 'package:flutter/material.dart';
import 'package:wisdom_show/colors/constants.dart';

import 'textFieldContainer.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key, this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
          onChanged: onChanged, 
            obscureText: true,
            decoration: InputDecoration(
                hintText: "Password",
                icon: Icon(
                  Icons.lock,
                  color: kSecondColor,
                ),
                suffixIcon: Icon(Icons.visibility, color: kSecondColor),
                border: InputBorder.none)));
  }
}

import 'package:flutter/material.dart';
import 'package:wisdom_show/colors/constants.dart';

import 'textFieldContainer.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChange;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
          onChanged: onChange,
      decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kSecondColor,
          ),
          hintText: hintText,
          border: InputBorder.none),
    ));
  }
}


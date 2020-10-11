import 'package:flutter/material.dart';
import 'package:wisdom_show/colors/constants.dart';

class OrDivider extends StatelessWidget {
  @required
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
        width: size.width * 0.8,
        child: Row(children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: kBackgroundColor),
            ),
          ),
          buildDivider(),
        ]));
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: Color(0xFFD9D9D9),
        height: 1.5,
      ),
    );
  }
}

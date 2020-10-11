import 'package:flutter/material.dart';
import 'package:wisdom_show/colors/constants.dart';

class SocialIcons extends StatelessWidget {
  final String iconScr;
  final Function press;
  const SocialIcons({
    Key key,
    this.iconScr,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: kBackgroundColor,
            ),
            shape: BoxShape.circle),
        child: Image.asset(
          iconScr,
          height: 20,
          width: 20,
          color: kBackgroundColor,
        ),
      ),
    );
  }
}

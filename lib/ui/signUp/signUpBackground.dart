import 'package:flutter/material.dart';

class SignUpBackground extends StatelessWidget {
  final Widget child;
  const SignUpBackground({
    Key key,
    @required this.child,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(alignment: Alignment.center, children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset("images/maintop.png"),
          width: size.width * 0.9,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset("images/mainbottom.png"),
          width: size.width * 0.5,
        ),
        child,
      ]),
    );
  }
}

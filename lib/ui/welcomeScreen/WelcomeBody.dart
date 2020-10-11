import 'package:flutter/material.dart';
import 'package:wisdom_show/colors/constants.dart';
import 'package:wisdom_show/ui/components/roundedButton.dart';
import 'package:wisdom_show/ui/login/login.dart';
import 'package:wisdom_show/ui/signUp/signup.dart';

import 'welcomeBackground.dart';

class WelcomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; // This is to make the screen size fit to all device
    // ignore: missing_required_param
    return WelcomeBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.20),
            Center(
                child: Container(
              child: Text(
                'WELCOME TO',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: kBackgroundColor),
              ),
            )),
            SizedBox(height: size.height * 0.06),
            Image.asset(
              'images/wisdomshowmain.png',
              height: size.height * 0.32,
            ),
            SizedBox(height: size.height * 0.09),
            RoundedButton(
              text: "LOGIN",
              color: kSecondColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Login();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: kBackgroundColor,
              textColor: Colors.white,
              press: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUp();
                    },
                  ),
                );},
            ),
          ],
        ),
      ),
    );
  }
}

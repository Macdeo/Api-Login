import 'package:flutter/material.dart';
import 'package:wisdom_show/colors/constants.dart';
import 'package:wisdom_show/ui/components/or_divider.dart';
import 'package:wisdom_show/ui/components/roundedButton.dart';
import 'package:wisdom_show/ui/components/roundedInputField.dart';
import 'package:wisdom_show/ui/components/roundedPasswordField.dart';
import 'package:wisdom_show/ui/components/socialIcons.dart';
import 'package:wisdom_show/ui/login/AlreadyHaveAnAccount.dart';
import 'package:wisdom_show/ui/login/login.dart';
import 'signUpBackground.dart';

class Body extends StatelessWidget {
  final Widget child;

  const Body({Key key, @required this.child}) : super(key: key);
  @required
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SignUpBackground(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.1),
            Text(
              "SIGN UP",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: kBackgroundColor),
            ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "images/signupicon.png",
              width: size.width * 0.8,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChange: (value) {},
            ),
            RoundedPasswordField(onChanged: (value) {}),
            RoundedButton(text: "Sign Up", press: () {}),
            //SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccount(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Login();
                      },
                    ),
                  );
                }),
            OrDivider(),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              SocialIcons(
                iconScr: "images/Icons/facebook.png",
                press: () {},
              ),
              SocialIcons(
                iconScr: "images/Icons/twitter.png",
                press: () {},
              ),
              SocialIcons(
                iconScr: "images/Icons/instagram.png",
                press: () {},
              ),
            ])
          ]),
    );
  }
}


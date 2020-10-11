import 'package:flutter/material.dart';
import 'package:wisdom_show/colors/constants.dart';
import 'package:wisdom_show/model/login_model.dart';
// import 'package:wisdom_show/ui/components/roundedButton.dart';
// import 'package:wisdom_show/ui/components/roundedInputField.dart';
// import 'package:wisdom_show/ui/components/roundedPasswordField.dart';
// import 'package:wisdom_show/ui/signUp/signup.dart';
// import 'AlreadyHaveAnAccount.dart';
//import 'loginBackground.dart';
import 'package:wisdom_show/api/api_service.dart';
import 'package:wisdom_show/progressHUB.dart';
//import 'package:wisdom_show/shared_service.dart';
import 'package:wisdom_show/ui/login/loginBackground.dart';
// import 'textFieldContainer.dart';

class LoginBody extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginBody> {
  // const LoginBody({
  //   Key key,
  // }) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool hidePassword = true;
  LoginRequestModel loginRequestModel;
  bool isApiCallProgress = false;
  Future<void> loginResponse() async {
    ApiService apiService = ApiService();
    var response = await apiService.login(loginRequestModel);
    setState(() {
      isApiCallProgress = false;
    });

    if (response) {
      final snackBar = SnackBar(
        content: Text('Login Successful'),
      );
      scaffoldKey.currentState.showSnackBar(snackBar);

      //SharedService.setLoginDetails(value);
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      final snackBar = SnackBar(
        content: Text('Login Failed'),
      );
      scaffoldKey.currentState.showSnackBar(snackBar);
    }
  }

  @override
  void initState() {
    super.initState();
    loginRequestModel = LoginRequestModel();
    loginRequestModel.username = 'eve.holt@reqres.in';
    loginRequestModel.password = 'cityslicka';
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: _uiSetup(context),
      inAsyncCall: isApiCallProgress,
      opacity: 0.3,
    );
  }

  @override
  Widget _uiSetup(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Scaffold(
        key: scaffoldKey,
        body: LoginBackground(
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.10),
                  Text('LOGIN',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: kBackgroundColor)),
                  Image.asset(
                    "images/loginicon.png",
                    height: size.height * 0.32,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    width: size.width * 0.85,
                    child: Form(
                      key: globalFormKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            initialValue: loginRequestModel.username,
                            onSaved: (input) => loginRequestModel.username = input,
                            validator: (input) => !input.contains('')
                                ? "User Name Id should be Valid"
                                : null,
                            decoration: InputDecoration(
                                hintText: 'User Name',
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .accentColor
                                        .withOpacity(0.2),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor),
                                ),
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Theme.of(context).accentColor,
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                            initialValue: loginRequestModel.password,
                            keyboardType: TextInputType.text,
                            onSaved: (input) =>
                                loginRequestModel.password = input,
                            validator: (input) => input.length < 3
                                ? "Password should be more than 3 characters"
                                : null,
                            obscureText: hidePassword,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.2),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context).accentColor),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Theme.of(context).accentColor,
                              ),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      hidePassword = !hidePassword;
                                    });
                                  },
                                  color: Theme.of(context)
                                      .accentColor
                                      .withOpacity(0.4),
                                  icon: Icon(hidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                                horizontal: 80, vertical: 12),
                            onPressed: () {
                              if (validationAndSave()) {
                                setState(() {
                                  isApiCallProgress = true;
                                });
                                loginResponse();
                                print(loginRequestModel.toJson());
                              }
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                            color: kSecondColor,
                            shape: StadiumBorder(),
                          )
                        ],
                      ),
                    ),
                  )
                  // RoundedInputField(
                  //   hintText: "Your Email",
                  //   onChange: (value) {},
                  // ),
                  // RoundedPasswordField(
                  //   onChanged: (value) {},
                  // ),
                  // RoundedButton(
                  //   text: "LOGIN",
                  //   press: () {},
                  //   color: kSecondColor,
                  // ),
                  // SizedBox(height: size.height * 0.03),
                  // AlreadyHaveAnAccount(
                  //   press: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) {
                  //           return SignUp();
                  //         },
                  //       ),
                  //     );
                  //   },
                  // )
                ]),
          ),
        ),
      ),
    );
  }

  bool validationAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}

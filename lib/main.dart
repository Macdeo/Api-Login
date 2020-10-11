import 'package:flutter/material.dart';
import 'package:wisdom_show/ui/home.dart';
//import 'package:wisdom_show/ui/welcomeScreen/welcome.dart';

import 'colors/constants.dart';
import 'shared_service.dart';
import 'ui/login/login.dart';
import 'ui/welcomeScreen/welcome.dart';

Widget _defaultHome = Welcome();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  bool _isLoggedIn = await SharedService.isLoggedIn();

  if (_isLoggedIn) {
    _defaultHome = new Home();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _defaultHome,
      routes: <String, WidgetBuilder>{
        '/home' : (BuildContext context) => Home(),
        '/login' : (BuildContext context) => Login()

      },
    );
  }
}


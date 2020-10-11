import 'package:flutter/material.dart';
import 'package:wisdom_show/shared_service.dart';
import 'package:wisdom_show/widgets/widget_home_categories.dart';
import 'package:wisdom_show/widgets/widget_repost_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text('Dashboard'),
          actions: [
            GestureDetector(
              onTap: () {
                SharedService.logout().then((_) =>
                    Navigator.of(context).pushReplacementNamed('/login'));
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                    child: Icon(Icons.power_settings_new),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Text(
                      'Logout',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            )
          ]),
      body: _uiSetup(),
    );
  }

  Widget _uiSetup() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(0),
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  DashboardItems(),
                  WidgetReportList(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wisdom_show/utils/hex_colors.dart';

class DashboardItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildListCategory(context)]),
    );
  }

  _buildListCategory(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Container(
      height: 150,
      child: GridView.count(
        crossAxisCount: 3,
        children: [
          makeDashboardItems(
            mediaQueryData,
            'Active\nUsers',
            '#3FC379',
            Icon(Icons.verified_user),
            Border(
              right: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
              bottom: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            () => {},
          ),
          makeDashboardItems(
            mediaQueryData,
            'Inactive\nUsers',
            '#FFCD42',
            Icon(Icons.help),
            Border(
              right: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
              bottom: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            () => {},
          ),
          makeDashboardItems(
              mediaQueryData,
              'Deleted\nUsers',
              '#D13839',
              Icon(Icons.delete),
              Border(
                right: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
                bottom: BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              () => {})
        ],
      ),
    );
  }

  Card makeDashboardItems(MediaQueryData query, String title, String color,
      Icon icon, Border border, Function onTap) {
    double width = query.size.width;

    double fontSize = (width * 3) / 100;
    double imageSize = (width * 18) / 100;
    return Card(
      elevation: 5,
      color: HexColors(color),
      margin: EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          color: HexColors(color),
        ),
        child: Center(
            child: InkWell(
                onTap: onTap,
                child: FractionalTranslation(
                    translation: Offset(0.0, 0.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      verticalDirection: VerticalDirection.down,
                      children: <Widget>[
                        Center(
                          child: ClipOval(
                            child: Container(
                              height: imageSize,
                              width: imageSize,
                              child: Center(
                                child: icon,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Center(
                          child: Text(
                            title.toUpperCase(),
                            style: TextStyle(
                              fontSize: fontSize,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 5.0)
                      ],
                    )))),
      ),
    );
  }
}

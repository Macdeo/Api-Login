import 'package:flutter/material.dart';
import 'package:wisdom_show/api/api_service.dart';
import 'package:wisdom_show/model/user_model.dart';

class WidgetReportList extends StatefulWidget {
  @override
  _WidgetReportListState createState() => _WidgetReportListState();
}

class _WidgetReportListState extends State<WidgetReportList> {
  ApiService apiService;
  @override
  void initState() {
    super.initState();
    apiService = new ApiService();
  }

  @override
  Widget build(BuildContext context) {
    return _fetchData();
  }

  Widget _fetchData() {
    return FutureBuilder<DataModel>(
      future: apiService.getUsers(),
      builder: (BuildContext context, AsyncSnapshot<DataModel> snapshot) {
        if (snapshot.hasData) {
          return _buildDataTable(snapshot.data);
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildDataTable(DataModel dataModel) {
    return DataTable(
      columns: [
        DataColumn(
          label: Text(
            'Name',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
          ),
        ),
        DataColumn(
          label: Text(
            'Email',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
          ),
        ),
      ],
      sortColumnIndex: 1,
      rows: dataModel.data.map(
        (data) => DataRow(
          cells: <DataCell>[
            DataCell(
              Row(
                children: [
                  Image.asset(
                    // data.avatar,
                    'images/loginicon.png',
                    width: 30,
                    height: 30,
                  ),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        data.firstName + '' + data.lastName,
                        style: TextStyle(fontSize: 13),
                      ))
                ],
              ),
            ),
            DataCell(
              Text(
                data.email,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ).toList(),
    );
  }
}

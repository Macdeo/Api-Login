import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:wisdom_show/model/login_model.dart';
import 'package:wisdom_show/model/user_model.dart';

class ApiService {
  Future<bool> login(LoginRequestModel requestModel) async {
    String url =
        'https://lsm.macdeo.com/index.php?option=com_api&app=users&resource=login&format=raw';

    // Create storage
    final storage = new FlutterSecureStorage();
    final response = await http.post(url, body: requestModel.toJson());
    var responseBody = json.decode(response.body);
    print(responseBody['err_code']);
    if (responseBody['err_code'].toString()?.isEmpty ?? true) {
      // Write value
      var data = json.decode(response.body);
      await storage.write(key: 'token', value: (data['data']['auth']));
      await storage.write(key: 'userid', value: (data['data']['id']));
      print(data['data']['auth']);
      print(response.body);
      return true;
    } else {
      return false;
    }
  }

  Future<DataModel> getUsers() async {
    // Read value
    final storage = new FlutterSecureStorage();
    String value = await storage.read(key: 'token');
    String userid = await storage.read(key: 'userid');
    print(value);
    String url =
        'http://lsm.macdeo.com/index.php?option=com_api&format=raw&app=users&resource=user&key=$value';

    final response = await http.get(url, headers: {
      HttpHeaders.authorizationHeader: 'Bearer $value',
      HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
    });
    var responseBody = json.decode(response.body);
    print(response.body);
    if (response.statusCode == 200) {
      return DataModel.fromJson(json.decode(responseBody['data'].toString()));
    } else {
    throw Exception('Failed to load Data');
    }
  }
}

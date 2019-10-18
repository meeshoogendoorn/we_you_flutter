import 'dart:async';
import 'dart:convert';

import 'package:survey_app/utils/network.dart';

class RestDataSource {
  static const BASE_URL = 'http://dev.meeshoogendoorn.nl/api';
  static const AUTH_URL = BASE_URL + "/accounts/login/";

  // defining constant variables for authentication
  NetworkUtil _netUtil = new NetworkUtil();
  //TODO == API token based

  // handler for login request
  Future<String> login(String username, String password) {
    return _netUtil.post(AUTH_URL, headers: {
      "Authorization": 'Basic ' + base64Encode(utf8.encode('$username:$password'))
    }).then((dynamic res){
//      print(res.toString());
//      if(res["detail"]) {
//        throw new Exception(res["detail"]);
//      }
      return res["token"].toString();
    });
  }
}

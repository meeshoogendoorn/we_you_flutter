import 'dart:async';
import 'dart:convert';

import 'package:survey_app/utils/network.dart';

class RestDataSource {
  // defining constant variables for authentication
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = 'http://dev.meeshoogendoorn.nl/api';
  static final AUTH_URL = BASE_URL + "/accounts/login/";
  //TODO == API token based

  // handler for login request
  Future<String> login(String username, String password) {
    return _netUtil.post(AUTH_URL, headers: {
      "authorization": 'Basic ' + base64Encode(utf8.encode('$username:$password'))
    }).then((dynamic res){
      print(res.toString());
//      if(res["detail"]) {
//        throw new Exception(res["detail"]);
//      }
      return res["token"].toString();
    });
  }
}
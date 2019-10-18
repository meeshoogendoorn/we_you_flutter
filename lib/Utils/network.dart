import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkUtil {
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();

  // function for handling GET requests to the API
  Future<dynamic> get(String url){
    return http.get(url).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      return checkStatusCode(res, statusCode, json);
    });
  }

  // function for handling POST requests to the API
  Future<dynamic> post(String url, {headers, body, encoding}) {
    return http.post(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      return checkStatusCode(res, statusCode, json);
    });
  }

  // statusCode checker for all requests to API
  checkStatusCode(res, statusCode, json){
    if(statusCode < 200 || statusCode > 400 || json == null){
      throw new Exception("Error while fetching data");
    }
    return _decoder.convert(res);
  }
}

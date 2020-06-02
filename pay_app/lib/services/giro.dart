import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class GiroServices {
  static const X_TAG = 'MDg4NWM1NTA0ZTZlNTQ5MjAzNzA1ODBlOWVkNzI3MzdlNmYxZTcyMjVkOTA3N2JjYTBhZjA0YmM0N2U4NDZkNi8vLy8vLzQ1MDY=';
  static const AUTHORIZATION_BEARER_TOKEN = 'gBbcymVzzxqrBh+daCW5QtI99LZ9JuEL736vLPD7A6A=';
  static const AUTHORIZATION_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InVzZXJAZW5zZW1ibGVsYWIuY29tLm5nIiwidXNlciI6eyJfaWQiOiI1YWY1ZmE2Y2ZhODg3Y2I2NjIyY2IyMjQiLCJtb2RlbCI6IlVzZXJzIiwiX192Ijo1LCJ0YWdzIjpbXSwiY3JlYXRlZEF0IjoiMjAxOC0wNS0xMVQyMDoxNzo0OC44OTBaIiwicm9sZXMiOlsiNWFmNWZhNmRmYTg4N2NiNjYyMmNiMjJhIiwiNWFmNWZhNWFmYTg4N2NiNjYyMmNiMjE2Il0sImlzQmxvY2tlZCI6ZmFsc2UsImt5Y1ZlcmlmaWNhdGlvblN0YXR1cyI6Im5vdF92ZXJpZmllZCIsImF1dGhlbnRpY2F0aW9ucyI6WyI1YWY1ZmE2Y2ZhODg3Y2I2NjIyY2IyMjgiXSwiYWRkcmVzc0Jvb2tzIjpbIjVhZjVmYTZjZmE4ODdjYjY2MjJjYjIyNSJdLCJhY2NvdW50cyI6WyI1YWY1ZmE2Y2ZhODg3Y2I2NjIyY2IyMjciXSwicmVmZXJyYWxDb2RlIjoiSEpyX3FfN0F6In0sImFjY291bnQiOnsiX2lkIjoiNWFmNWZhNmNmYTg4N2NiNjYyMmNiMjI3IiwibmFtZSI6InVzZXJAZW5zZW1ibGVsYWIuY29tLm5nIiwiX192IjowLCJ0YWdzIjpbXSwiY3JlYXRlZEF0IjoiMjAxOC0wNS0xMVQyMDoxNzo0OC45MTFaIiwidXNlcnMiOlsiNWFmNWZhNmNmYTg4N2NiNjYyMmNiMjI0Il19LCJpYXQiOjE1MjYwNzAwOTgsImV4cCI6MTUyNjA3MzY5OCwiYXVkIjoibXlnaXJvLmNvIiwiaXNzIjoiZW5zZW1ibGVsYWIuY29tLm5nIiwic3ViIjoiNWFmNWZhNmNmYTg4N2NiNjYyMmNiMjI0In0.ml2qNkfHqpLeInKy-7g-Np4KPPKnJDPncKb03fnNmSc';
  static const ACCOUNT_ID = '5e329d527567300017b071ae';
  static const USER_ID = '5e329d527567300017b071ab';
  static const REGISTER_URL = 'https://sandbox.mygiro.co/v1/register';
  static const LOGIN_URL = 'https://sandbox.mygiro.co/v1/login';
  static const FORGOTPASS_URL = 'https://sandbox.mygiro.co/v1/forgotPassword';
  static const GEN_AUTH_URL = 'https://sandbox.mygiro.co/v1/users/5a981078f4442500195c7201/generateaccesstoken?accountId=$ACCOUNT_ID';
  Map<String, String> headers = {
    'Authorization': 'Bearer $AUTHORIZATION_BEARER_TOKEN',
    'x-tag': X_TAG,
    'Content-Type': 'application/json'
  };

  Future<String> createUser({ String email, String password}) async {
    Map<String, String> body = {
      'email': email,
      'password': password,
    };

    var data = json.encode(body);

    String registerId;
    var response = await http.post(REGISTER_URL, body: data, headers: headers);
    registerId = response.body;
    return registerId;
  }

  Future<String> forgotPassword({String email}) async {
    Map<String, String> body = {
      'email': email,
    };

    var data = json.encode(body);

    String registerId;
    var response = await http.post(FORGOTPASS_URL, body: data, headers :{
      'Content-Type': 'application/json',
      'x-tag': X_TAG
    });
    registerId = response.body;
    return registerId;
  }

  Future<String> verifySignUp ({String email}) async {
    Map<String, String> body = {
      'email': email,
    };

    var data = json.encode(body);

    String registerId;
    var response = await http.post(FORGOTPASS_URL, body: data, headers :{
      'Content-Type': 'application/json',
      'x-tag': X_TAG
    });
    registerId = response.body;
    return registerId;
  }


  Future<String> loginUser({String email, String password}) async {
    Map<String, String> body = {
      'email': email,
      'password': password
    };

    var data = json.encode(body);

    String jwtToken;
    var response = await http.post(LOGIN_URL, body: data, headers :{
      'Content-Type': 'application/json',
      'x-tag': X_TAG
    });
     jwtToken = jsonDecode(response.body)['data']['jwt'];
    return jwtToken;
  }

  Future<Map> generateAuthenticationToken ({String email, String password}) async {
//    Map<String, String> body = {
//      'accountId': accountId,
//    };

//    var data = json.encode(body);

    Map authenticationToken;
    String jwt = await loginUser(email: email, password: password );
    var response = await http.get(GEN_AUTH_URL, headers:{
      'Content-Type': 'application/json',
      'x-tag': X_TAG,
      'Authorization':  'Bearer $jwt}'
    });
    print ('abbbb');
    authenticationToken = jsonDecode(response.body)['data'];
    print ('abbbb');
    return authenticationToken;
  }

}

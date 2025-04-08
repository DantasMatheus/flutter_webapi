import 'dart:convert';
import 'dart:io' show HttpException;
import 'package:http/http.dart' as http;
import 'http_interceptors.dart';
import 'package:http_interceptor/http_interceptor.dart';

class AuthService {
  //TODO: Modularizar o endpoint
  static const String url = "http://10.0.39.30:3000/";

  http.Client client = InterceptedClient.build(
    interceptors: [LoggerInterceptor()],
  );

  Future<bool> login({required String email, required String password}) async {
    http.Response response = await client.post(
      Uri.parse('${url}login'),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode != 200) {
      String content = json.decode(response.body);
      switch (content) {
        case "Cannot find user":
          throw UserNotFoundException();
      }
      throw HttpException(response.body);
    }

    return true;
  }

  register({required String email, required String password}) async {
    http.Response response = await client.post(
      Uri.parse('${url}register'),
      body: {'email': email, 'password': password},
    );
  }
}

class UserNotFoundException implements Exception {}

import 'package:flutter_webapi_first_course/services/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

class WebClient {
  static const String url = "http://10.0.39.30:3000/";
  http.Client client = InterceptedClient.build(
    interceptors: [LoggerInterceptor()],
    requestTimeout: const Duration(seconds: 5),
  );
}

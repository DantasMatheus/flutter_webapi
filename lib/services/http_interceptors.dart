import 'package:http_interceptor/http_interceptor.dart';
import 'dart:developer';

class LoggerInterceptor extends InterceptorContract {
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    log('----- Request -----');
    log('URL: ${request.url}');
    log('Headers: ${request.headers}');
    if (request is Request) {
      log('Body: ${request.body}');
    }
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    log('----- Response -----');
    log('Status Code: ${response.statusCode}');
    if (response is Response) {
      log('Body: ${response.body}');
    }
    return response;
  }
}

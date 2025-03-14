import 'dart:math';

import 'package:http_interceptor/http_interceptor.dart';

class LoggerInterceptor extends InterceptorContract {
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    print('----- Request -----');
    print(request.toString());
    print(request.headers.toString());
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    log('----- Response -----' as num);
    log('Code: ${response.statusCode}' as num);
    if (response is Response) {
      log((response).body as num);
    }
    return response;
  }
}

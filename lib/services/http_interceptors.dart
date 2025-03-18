import 'package:http_interceptor/http_interceptor.dart';
import 'package:logger/logger.dart';

class LoggerInterceptor extends InterceptorContract {
  Logger logger = Logger();

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    logger.t('----- Request -----');
    logger.t('URL: ${request.url}');
    logger.t('Headers: ${request.headers}');
    if (request is Request) {
      logger.t('Body: ${request.body}');
    }
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse({
    required BaseResponse response,
  }) async {
    if (response.statusCode ~/ 100 == 2) {
      logger.d(
        "-------- Response --------\nStatus Code: ${response.statusCode}\n",
      );
      if (response is Response) {
        logger.d('Body: ${response.body}');
      }
    } else {
      logger.w(
        "-------- Response --------\nStatus Code: ${response.statusCode}\nHeaders: ${response.headers}",
      );
      if (response is Response) {
        logger.w('Body: ${response.body}');
      }
    }

    return response;
  }
}

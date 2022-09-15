
import 'base_api_exception.dart';

class ApiException extends BaseApiException {
  ApiException({
    required int httpCode,
    required String status,
    String message = "",
    String? i18n
  }) : super(httpCode: httpCode, status: status, message: message,i18n:i18n);
}

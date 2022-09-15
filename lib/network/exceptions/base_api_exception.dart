import 'app_exception.dart';

abstract class BaseApiException extends AppException {
  final int httpCode;
  final String status;

  BaseApiException(
      {this.httpCode = -1,
      this.status = "",
      String message = "",
      String? i18n = ""})
      : super(message: message, i18n: i18n);
}

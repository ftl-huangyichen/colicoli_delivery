import 'dart:io';

import 'base_api_exception.dart';

class UnauthorizedException extends BaseApiException {
  UnauthorizedException(String message, String? i18n)
      : super(
            httpCode: HttpStatus.unauthorized,
            message: message,
            status: "unauthorized",
            i18n: i18n);
}

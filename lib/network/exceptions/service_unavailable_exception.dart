import 'dart:io';

import 'base_api_exception.dart';

class ServiceUnavailableException extends BaseApiException {
  ServiceUnavailableException(String message,String? i18n)
      : super(
            httpCode: HttpStatus.serviceUnavailable,
            message: message,
            status: "",
            i18n: i18n);
}

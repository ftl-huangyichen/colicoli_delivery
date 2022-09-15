import 'dart:io';

import 'api_exception.dart';

class NotFoundException extends ApiException {
  NotFoundException(String message, String? i18n, String status)
      : super(
            httpCode: HttpStatus.notFound,
            status: status,
            message: message,
            i18n: i18n);
}

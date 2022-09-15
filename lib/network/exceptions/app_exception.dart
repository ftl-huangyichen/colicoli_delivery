import 'base_exception.dart';

class AppException extends BaseException {
  AppException({String message = "", String? i18n})
      : super(message: message, i18n: i18n);
}

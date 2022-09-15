import 'base_exception.dart';

class TimeoutException extends BaseException {
  TimeoutException(String message,String? i18n) : super(message: message,i18n: i18n);
}

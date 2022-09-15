abstract class BaseException implements Exception {
  final String message;
  final String? i18n;

  BaseException({this.message = "",this.i18n});
}

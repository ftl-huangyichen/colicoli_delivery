import 'dart:async';
import 'dart:io';

import 'package:colicoli_delivery/intl/str_res_keys.dart';
import 'package:colicoli_delivery/network/exceptions/timeout_exception.dart';
import 'package:dio/dio.dart';

import '/flavors/build_config.dart';
import 'exceptions/api_exception.dart';
import 'exceptions/app_exception.dart';
import 'exceptions/network_exception.dart';
import 'exceptions/not_found_exception.dart';
import 'exceptions/service_unavailable_exception.dart';

Exception handleError(String error) {
  final logger = BuildConfig.instance.config.logger;
  logger.e("Generic exception: $error");

  return AppException(message: error);
}

Exception handleDioError(DioError dioError) {
  switch (dioError.type) {
    case DioErrorType.cancel:
      return AppException(message: SR.cancel_server, i18n: SR.cancel_server);
    case DioErrorType.connectTimeout:
      return AppException(message: SR.timeout_server, i18n: SR.timeout_server);
    case DioErrorType.other:
      return NetworkException(SR.connection_inernet, SR.connection_inernet);
    case DioErrorType.receiveTimeout:
      return TimeoutException(SR.receive_timeout, SR.receive_timeout);
    case DioErrorType.sendTimeout:
      return TimeoutException(SR.send_timeout, SR.receive_timeout);
    case DioErrorType.response:
      return _parseDioErrorResponse(dioError);
  }
}

Exception _parseDioErrorResponse(DioError dioError) {
  final logger = BuildConfig.instance.config.logger;

  int statusCode = dioError.response?.statusCode ?? -1;
  String? status;
  String? serverMessage;
  String? i18n;

  try {
    if (statusCode == -1 || statusCode == HttpStatus.ok) {
      statusCode = dioError.response?.data["statusCode"];
    }

    status = dioError.response?.statusCode?.toString();
    serverMessage = dioError.response?.data["message"];
    i18n = dioError.response?.data["i18n"] ?? serverMessage;
  } catch (e, s) {
    logger.i("$e");
    logger.i(s.toString());

    serverMessage = SR.something_wrong;
    i18n = serverMessage;
  }

  switch (statusCode) {
    case HttpStatus.serviceUnavailable:
      return ServiceUnavailableException(
          SR.service_unavaliable, SR.service_unavaliable);
    case HttpStatus.notFound:
      return NotFoundException(serverMessage ?? "", status ?? "", i18n ?? "");
    default:
      return ApiException(
          httpCode: statusCode,
          status: status ?? "",
          message: serverMessage ?? "",
          i18n: i18n);
  }
}

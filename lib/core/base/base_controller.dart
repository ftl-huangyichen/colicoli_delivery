import 'dart:async';
import 'dart:convert';

import 'package:colicoli_delivery/data/repository/colicoli_repository.dart';
import 'package:colicoli_delivery/network/exceptions/timeout_exception.dart';
import 'package:flutter_xupdate/flutter_xupdate.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:package_info/package_info.dart';

import '../../data/model/app_update_info.dart';
import '../../network/exceptions/api_exception.dart';
import '../../network/exceptions/app_exception.dart';
import '../../network/exceptions/json_format_exception.dart';
import '../../network/exceptions/network_exception.dart';
import '../../network/exceptions/not_found_exception.dart';
import '../../network/exceptions/service_unavailable_exception.dart';
import '../../network/exceptions/unauthorize_exception.dart';
import '../model/page_state.dart';
import '/flavors/build_config.dart';

abstract class BaseController extends GetxController {
  final Logger logger = BuildConfig.instance.config.logger;

  final ColiColiRepository repository =
  Get.find(tag: (ColiColiRepository).toString());

  @override
  void onInit() {
    try {
      FlutterXUpdate.setUpdateHandler(
          onUpdateError: (Map<String, dynamic>? message) async {
            showErrorMessage(message!['message']);
          }, onUpdateParse: (String? json) async {
        //这里是自定义json解析
        return customParseJson(json!!);
      });
      repository.getUpdate();
      super.onInit();
    } catch (e, _) {
      showErrorMessage(e.toString());
    }
  }

  // AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;

  final logoutController = false.obs;

  //Reload the page
  final _refreshController = false.obs;

  refreshPage(bool refresh) => _refreshController(refresh);

  //Controls page state
  final _pageSateController = PageState.DEFAULT.obs;

  PageState get pageState => _pageSateController.value;

  updatePageState(PageState state) => _pageSateController(state);

  resetPageState() => _pageSateController(PageState.DEFAULT);

  showLoading() => updatePageState(PageState.LOADING);

  hideLoading() => resetPageState();

  final _messageController = ''.obs;

  String get message => _messageController.value;

  showMessage(String msg) => _messageController(msg);

  final _errorMessageController = ''.obs;

  String get errorMessage => _errorMessageController.value;

  showErrorMessage(String msg) {
    _errorMessageController.value = "";
    _errorMessageController.value = msg;
  }

  final _successMessageController = ''.obs;

  String get successMessage => _successMessageController.value;

  showSuccessMessage(String msg) {
    _successMessageController.value = "";
    _successMessageController.value=msg;
  }


  // ignore: long-parameter-list
  dynamic callDataService<T>(Future<T> future, {
    Function(Exception exception)? onError,
    Function(T response)? onSuccess,
    Function? onStart,
    Function? onComplete,
  }) async {
    Exception? _exception;

    onStart == null ? showLoading() : onStart();

    try {
      final T response = await future;

      if (onSuccess != null) onSuccess(response);

      onComplete == null ? hideLoading() : onComplete();

      return response;
    } on ServiceUnavailableException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.i18n?.tr ?? '');
    } on UnauthorizedException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.i18n?.tr ?? '');
    } on TimeoutException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.i18n?.tr ?? '');
    } on NetworkException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.i18n?.tr ?? '');
    } on JsonFormatException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.i18n?.tr ?? '');
    } on NotFoundException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.i18n?.tr ?? '');
    } on ApiException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.i18n?.tr ?? '');
    } on AppException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.i18n?.tr ?? '');
    } catch (error) {
      _exception = AppException(message: "$error");
      showErrorMessage(error.toString());
      logger.e("Controller>>>>>> error $error");
    }

    if (onError != null) onError(_exception);

    onComplete == null ? hideLoading() : onComplete();
  }

  Future<UpdateEntity> customParseJson(String json) async {
    AppUpdateInfo appInfo = AppUpdateInfo.fromJson(jsonDecode(json));
    print(appInfo);

    var versionCode = appInfo.data?.versionCode;
    var hasUpdate = await compareVersion(versionCode!!);

    return UpdateEntity(
        hasUpdate: hasUpdate,
        isIgnorable: false,
        versionCode: versionCode,
        isForce: appInfo.data?.forceUpdate == 0,
        versionName: appInfo.data?.version,
        updateContent: appInfo.data?.description,
        downloadUrl: appInfo.data?.downloadUrl);
  }

  Future<bool> compareVersion(int versionCode) async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return (versionCode > int.parse(packageInfo.buildNumber));
  }

  @override
  void onClose() {
    _messageController.close();
    _refreshController.close();
    _pageSateController.close();
    super.onClose();
  }
}

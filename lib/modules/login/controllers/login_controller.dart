import 'package:colicoli_delivery/core/base/base_controller.dart';
import 'package:colicoli_delivery/data/model/login_response.dart';
import 'package:colicoli_delivery/data/repository/colicoli_repository.dart';
import 'package:colicoli_delivery/routes/app_routes.dart';
import 'package:colicoli_delivery/utils/sp_util.dart';
import 'package:get/get.dart';

import '../../../data/local/preference/preference_manager.dart';

class LoginController extends BaseController {
  final _loginResponse = LoginResponse().obs;
  final PreferenceManager _preferenceManager =
      Get.find(tag: (PreferenceManager).toString());

  get loginResponse => _loginResponse.value;
  final ColiColiRepository _repository =
      Get.find(tag: (ColiColiRepository).toString());

  void login(String username, String password) {
    callDataService(_repository.login(username, password),
        onSuccess: _handleLoginSuccess);
  }

  void getToken() async {
    var mToken = await _preferenceManager.getString(PreferenceManager.keyToken);
    if (mToken.isNotEmpty) {
      Get.toNamed(Routes.MAIN);
    }
  }

  void _handleLoginSuccess(LoginResponse loginResponse) async {
    var isSuccess = await _preferenceManager.setString(
        PreferenceManager.keyToken, loginResponse.token!!);
    if (isSuccess) {
      Get.toNamed(Routes.MAIN, preventDuplicates: false);
    } else {
      showErrorMessage("msg");
    }
  }
}

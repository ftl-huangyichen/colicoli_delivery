import 'package:colicoli_delivery/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/base/base_controller.dart';
import '../../../data/local/preference/preference_manager.dart';
import '../../../data/repository/colicoli_repository.dart';

class MainController extends BaseController {
  final PreferenceManager _preferenceManager =
      Get.find(tag: (PreferenceManager).toString());
  final ColiColiRepository _repository =
      Get.find(tag: (ColiColiRepository).toString());
  final _token = ''.obs;

  get token => _token.value;

  getToken() async {
    final String mToken =
        await _preferenceManager.getString(PreferenceManager.keyToken);
    _token.value = mToken;
  }

  logout() async {
    bool isLogout =
        await _preferenceManager.setString(PreferenceManager.keyToken, '');
    if (isLogout) {
      Get.toNamed(Routes.LOGIN);
    }
  }
}

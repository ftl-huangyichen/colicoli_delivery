
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/base/base_controller.dart';
import '../../../data/repository/colicoli_repository.dart';

class SettingController extends BaseController {

  final ColiColiRepository _repository =
  Get.find(tag: (ColiColiRepository).toString());

}
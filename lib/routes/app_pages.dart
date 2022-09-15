import 'package:colicoli_delivery/modules/login/bindings/login_binding.dart';
import 'package:colicoli_delivery/modules/main/views/main_page.dart';
import 'package:colicoli_delivery/modules/setting/bindings/setting_binding.dart';
import 'package:colicoli_delivery/modules/setting/views/setting_page.dart';
import 'package:colicoli_delivery/routes/app_routes.dart';
import 'package:get/get.dart';

import '../modules/login/views/view.dart';
import '../modules/main/bindings/main_binding.dart';

class AppPages {
  AppPages._();

  static const LOGIN = Routes.LOGIN;
  static const MAIN = Routes.MAIN;

  static final List<GetPage> routes = [
    GetPage(
        name: Paths.LOGIN, binding: LoginBinding(), page: () => LoginPage()),
    GetPage(name: Paths.MAIN, binding: MainBinding(), page: () => MainPage()),
    GetPage(
        name: Paths.SETTING,
        binding: SettingBinding(),
        page: () => SettingPage()),
  ];
}

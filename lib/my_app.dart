import 'dart:io';

import 'package:colicoli_delivery/bindings/initial_binding.dart';
import 'package:colicoli_delivery/data/local/preference/preference_manager.dart';
import 'package:colicoli_delivery/data/local/preference/preference_manager_impl.dart';
import 'package:colicoli_delivery/intl/str_res.dart';
import 'package:colicoli_delivery/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xupdate/flutter_xupdate.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

import 'core/values/app_colors.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _preferenceManager = PreferenceManagerImpl();
  String token = '';

  @override
  void initState()  {
    super.initState();
    initXUpdate();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ColiColi Delivery',
      theme: ThemeData(
        primarySwatch: AppColors.colorPrimarySwatch,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
        primaryColor: AppColors.colorPrimary,
        textTheme: const TextTheme(
          button: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        fontFamily: 'Roboto',
      ),
      initialRoute:  AppPages.LOGIN,
      initialBinding: InitialBinding(),
      getPages: AppPages.routes,
      translations: StrRes(),
      locale: ui.window.locale,
      fallbackLocale: const Locale('en', 'US'),
    );
  }
  getToken(PreferenceManager preferenceManager) async {
    token= await preferenceManager.getString(PreferenceManager.keyToken);
  }
}



initXUpdate() async {
  if (Platform.isAndroid) {
    await FlutterXUpdate.init(

        ///是否输出日志
        debug: true,

        ///是否使用post请求
        isPost: false,

        ///post请求是否是上传json
        isPostJson: false,

        ///请求响应超时时间
        timeout: 25000,

        ///是否开启自动模式
        isWifiOnly: false,

        ///是否开启自动模式
        isAutoMode: false,

        ///需要设置的公共参数
        supportSilentInstall: false,

        ///在下载过程中，如果点击了取消的话，是否弹出切换下载方式的重试提示弹窗
        enableRetry: false);
    print("初始化成功");
  }
}

import 'package:flutter/cupertino.dart';

import 'flavors/build_config.dart';
import 'flavors/env_config.dart';
import 'flavors/environment.dart';
import 'my_app.dart';

void main() {
  EnvConfig prodConfig = EnvConfig(
    appName: "ColiColi Delivery",
    baseUrl: "https://gateway-api.ftlapp.io/api",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.PRODUCTION,
    envConfig: prodConfig,
  );

  runApp(const MyApp());
}
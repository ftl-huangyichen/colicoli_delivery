import 'package:flutter/material.dart';

import 'flavors/build_config.dart';
import 'flavors/env_config.dart';
import 'flavors/environment.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvConfig devConfig = EnvConfig(
    appName: "ColiColi Delivery",
    baseUrl: "https://gateway-api-staging.ftlapp.io/api",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  runApp(const MyApp());
}

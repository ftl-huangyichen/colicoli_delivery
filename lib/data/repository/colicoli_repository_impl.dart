import 'package:colicoli_delivery/data/remote/colicoli_remote_data_source.dart';
import 'package:colicoli_delivery/data/repository/colicoli_repository.dart';
import 'package:flutter_xupdate/flutter_xupdate.dart';
import 'package:get/get.dart';

import '../../core/model/login_request.dart';
import '../model/login_response.dart';

class ColiColiRepositoryImpl implements ColiColiRepository {
  final ColiColiRemoteDataSource _remoteDataSource =
      Get.find(tag: (ColiColiRemoteDataSource).toString());

  @override
  Future<void> getUpdate() async {
    await FlutterXUpdate.checkUpdate(
      url:
          "https://app-version.ftlapp.io/rest/v/esendeo-v2-1.0.0.0-test-android",
      isCustomParse: true,
    );
  }

  @override
  Future<LoginResponse> login(String username, String password) {
    return _remoteDataSource.login(LoginRequest(
        appKey: 'E9jWjaCOmR6NWuXjcknj8fSfGPn1eNzO',
        username: username,
        password: password));
  }
}

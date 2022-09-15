import 'package:colicoli_delivery/core/base/base_remote_source.dart';
import 'package:colicoli_delivery/core/model/login_request.dart';
import 'package:colicoli_delivery/data/model/login_response.dart';
import 'package:colicoli_delivery/data/remote/colicoli_remote_data_source.dart';
import 'package:colicoli_delivery/network/dio_provider.dart';

class ColiColiRemoteDataSourceImpl extends BaseRemoteSource
    implements ColiColiRemoteDataSource {
  @override
  login(LoginRequest request) {
    var url = "${DioProvider.baseUrl}/auth/login";
    var dioCall = dioClient.post(url, data: request.toJson());
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => LoginResponse.fromJson(response.data));
    } catch (e) {
      rethrow;
    }
  }
}

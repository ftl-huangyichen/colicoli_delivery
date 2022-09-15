import 'package:colicoli_delivery/core/model/login_request.dart';
import 'package:colicoli_delivery/data/model/login_response.dart';

abstract class ColiColiRemoteDataSource {
  Future<LoginResponse> login(LoginRequest request);
}

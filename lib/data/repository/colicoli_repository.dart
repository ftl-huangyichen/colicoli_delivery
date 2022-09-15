import '../../core/model/login_request.dart';
import '../model/login_response.dart';

abstract class ColiColiRepository{
  Future<void> getUpdate();
  Future<LoginResponse> login(String username,String password);
}

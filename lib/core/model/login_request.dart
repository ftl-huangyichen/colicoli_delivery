/// appKey : "E9jWjaCOmR6NWuXjcknj8fSfGPn1eNzO"
/// password : "Ftl123456"
/// username : "huangyichen"

class LoginRequest {
  LoginRequest({
      String? appKey, 
      String? password, 
      String? username,}){
    _appKey = appKey;
    _password = password;
    _username = username;
}

  LoginRequest.fromJson(dynamic json) {
    _appKey = json['appKey'];
    _password = json['password'];
    _username = json['username'];
  }
  String? _appKey;
  String? _password;
  String? _username;

  String? get appKey => _appKey;
  String? get password => _password;
  String? get username => _username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['appKey'] = _appKey;
    map['password'] = _password;
    map['username'] = _username;
    return map;
  }

}
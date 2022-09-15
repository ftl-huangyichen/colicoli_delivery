/// errorId : "25a30f1e228b4d448886f747615150b8"
/// path : "/api/auth/login"
/// message : "LOGIN_PASSWORD_ERROR"
/// i18n : "The password is wrong, please confirm whether the password is correct"
/// timestamp : "2022-09-15T03:32:38.579Z"
/// subErrors : null

class ErrorResponse {
  ErrorResponse({
      String? errorId, 
      String? path, 
      String? message, 
      String? i18n, 
      String? timestamp, 
      dynamic subErrors,}){
    _errorId = errorId;
    _path = path;
    _message = message;
    _i18n = i18n;
    _timestamp = timestamp;
    _subErrors = subErrors;
}

  ErrorResponse.fromJson(dynamic json) {
    _errorId = json['errorId'];
    _path = json['path'];
    _message = json['message'];
    _i18n = json['i18n'];
    _timestamp = json['timestamp'];
    _subErrors = json['subErrors'];
  }
  String? _errorId;
  String? _path;
  String? _message;
  String? _i18n;
  String? _timestamp;
  dynamic _subErrors;

  String? get errorId => _errorId;
  String? get path => _path;
  String? get message => _message;
  String? get i18n => _i18n;
  String? get timestamp => _timestamp;
  dynamic get subErrors => _subErrors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['errorId'] = _errorId;
    map['path'] = _path;
    map['message'] = _message;
    map['i18n'] = _i18n;
    map['timestamp'] = _timestamp;
    map['subErrors'] = _subErrors;
    return map;
  }

}
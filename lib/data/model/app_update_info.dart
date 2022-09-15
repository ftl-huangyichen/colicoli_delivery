/// code : 200
/// message : "请求成功"
/// data : {"allowLowestVersion":"1.0.0.0","downloadUrl":"https://ftl-assets.s3.eu-west-1.amazonaws.com/app-version/apk/Import-Twms-official-2.4.1.0.apk","description":"fix a bug","forceUpdate":0,"version":"2.4.1.0","versionCode":1}

class AppUpdateInfo {
  AppUpdateInfo({
      int? code, 
      String? message, 
      Data? data,}){
    _code = code;
    _message = message;
    _data = data;
}

  AppUpdateInfo.fromJson(dynamic json) {
    _code = json['code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  int? _code;
  String? _message;
  Data? _data;

  int? get code => _code;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// allowLowestVersion : "1.0.0.0"
/// downloadUrl : "https://ftl-assets.s3.eu-west-1.amazonaws.com/app-version/apk/Import-Twms-official-2.4.1.0.apk"
/// description : "fix a bug"
/// forceUpdate : 0
/// version : "2.4.1.0"
/// versionCode : 1

class Data {
  Data({
      String? allowLowestVersion, 
      String? downloadUrl, 
      String? description, 
      int? forceUpdate, 
      String? version, 
      int? versionCode,}){
    _allowLowestVersion = allowLowestVersion;
    _downloadUrl = downloadUrl;
    _description = description;
    _forceUpdate = forceUpdate;
    _version = version;
    _versionCode = versionCode;
}

  Data.fromJson(dynamic json) {
    _allowLowestVersion = json['allowLowestVersion'];
    _downloadUrl = json['downloadUrl'];
    _description = json['description'];
    _forceUpdate = json['forceUpdate'];
    _version = json['version'];
    _versionCode = json['versionCode'];
  }
  String? _allowLowestVersion;
  String? _downloadUrl;
  String? _description;
  int? _forceUpdate;
  String? _version;
  int? _versionCode;

  String? get allowLowestVersion => _allowLowestVersion;
  String? get downloadUrl => _downloadUrl;
  String? get description => _description;
  int? get forceUpdate => _forceUpdate;
  String? get version => _version;
  int? get versionCode => _versionCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['allowLowestVersion'] = _allowLowestVersion;
    map['downloadUrl'] = _downloadUrl;
    map['description'] = _description;
    map['forceUpdate'] = _forceUpdate;
    map['version'] = _version;
    map['versionCode'] = _versionCode;
    return map;
  }

}
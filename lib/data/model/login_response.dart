/// sub : 313
/// token : "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIzMTMiLCJyb2xlcyI6IlJPTEVfQ09MSUNPTElfUERBX0FETUlOIiwidXNlcm5hbWUiOiJodWFuZ3lpY2hlbiIsInR5cGUiOiJBRE1JTiIsImdyb3VwIjoiTUFOQUdFUiIsIm93bmVyIjoiTUFOQUdFUiIsImxhbmd1YWdlIjoiY24iLCJ2ZXJzaW9uIjoidjEuMyIsInRva2VuVHlwZSI6IlBEQSIsImFwcCI6IkU5aldqYUNPbVI2Tld1WGpja25qOGZTZkdQbjFlTnpPIiwiZW52Ijoic3RhZ2luZyIsImp0aSI6Ijc3Njg4NWE2YTI3MTQxN2FiMGJhMjExZDZjNzc3OTI1IiwiZXhwIjoxNjY1ODA0ODkwfQ.hTuyTivw2-gbljLDaBOgKKK_RgMC9gkqbYcqWHbBbdh910B984G6HsJZ5l8Shu7bvpc3zXSQDZkizEkVs96gWA"
/// tokenType : "LOGIN"
/// refreshToken : ""
/// accountId : 313
/// originAccountId : ""
/// roles : ["ROLE_COLICOLI_PDA_ADMIN"]
/// username : "huangyichen"
/// type : "ADMIN"
/// groupId : 302
/// group : "MANAGER"
/// owner : null
/// language : "cn"
/// appKey : "E9jWjaCOmR6NWuXjcknj8fSfGPn1eNzO"
/// extension : {"defaultWarehouse":{"name":"Garonor","abbreviation":"EP_GAR"},"allowWarehouses":[{"name":"Garonor","abbreviation":"EP_GAR"},{"name":"CDGFE2","abbreviation":"EP_FE2"},{"name":"Vatry","abbreviation":"EP_VAT"},{"name":"Sogaris","abbreviation":"EP_SOG"}]}

class LoginResponse {
  LoginResponse({
      int? sub, 
      String? token, 
      String? tokenType, 
      String? refreshToken, 
      int? accountId, 
      String? originAccountId, 
      List<String>? roles, 
      String? username, 
      String? type, 
      int? groupId, 
      String? group, 
      dynamic owner, 
      String? language, 
      String? appKey, 
      Extension? extension,}){
    _sub = sub;
    _token = token;
    _tokenType = tokenType;
    _refreshToken = refreshToken;
    _accountId = accountId;
    _originAccountId = originAccountId;
    _roles = roles;
    _username = username;
    _type = type;
    _groupId = groupId;
    _group = group;
    _owner = owner;
    _language = language;
    _appKey = appKey;
    _extension = extension;
}

  LoginResponse.fromJson(dynamic json) {
    _sub = json['sub'];
    _token = json['token'];
    _tokenType = json['tokenType'];
    _refreshToken = json['refreshToken'];
    _accountId = json['accountId'];
    _originAccountId = json['originAccountId'];
    _roles = json['roles'] != null ? json['roles'].cast<String>() : [];
    _username = json['username'];
    _type = json['type'];
    _groupId = json['groupId'];
    _group = json['group'];
    _owner = json['owner'];
    _language = json['language'];
    _appKey = json['appKey'];
    _extension = json['extension'] != null ? Extension.fromJson(json['extension']) : null;
  }
  int? _sub;
  String? _token;
  String? _tokenType;
  String? _refreshToken;
  int? _accountId;
  String? _originAccountId;
  List<String>? _roles;
  String? _username;
  String? _type;
  int? _groupId;
  String? _group;
  dynamic _owner;
  String? _language;
  String? _appKey;
  Extension? _extension;

  int? get sub => _sub;
  String? get token => _token;
  String? get tokenType => _tokenType;
  String? get refreshToken => _refreshToken;
  int? get accountId => _accountId;
  String? get originAccountId => _originAccountId;
  List<String>? get roles => _roles;
  String? get username => _username;
  String? get type => _type;
  int? get groupId => _groupId;
  String? get group => _group;
  dynamic get owner => _owner;
  String? get language => _language;
  String? get appKey => _appKey;
  Extension? get extension => _extension;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sub'] = _sub;
    map['token'] = _token;
    map['tokenType'] = _tokenType;
    map['refreshToken'] = _refreshToken;
    map['accountId'] = _accountId;
    map['originAccountId'] = _originAccountId;
    map['roles'] = _roles;
    map['username'] = _username;
    map['type'] = _type;
    map['groupId'] = _groupId;
    map['group'] = _group;
    map['owner'] = _owner;
    map['language'] = _language;
    map['appKey'] = _appKey;
    if (_extension != null) {
      map['extension'] = _extension?.toJson();
    }
    return map;
  }

}

/// defaultWarehouse : {"name":"Garonor","abbreviation":"EP_GAR"}
/// allowWarehouses : [{"name":"Garonor","abbreviation":"EP_GAR"},{"name":"CDGFE2","abbreviation":"EP_FE2"},{"name":"Vatry","abbreviation":"EP_VAT"},{"name":"Sogaris","abbreviation":"EP_SOG"}]

class Extension {
  Extension({
      DefaultWarehouse? defaultWarehouse, 
      List<AllowWarehouses>? allowWarehouses,}){
    _defaultWarehouse = defaultWarehouse;
    _allowWarehouses = allowWarehouses;
}

  Extension.fromJson(dynamic json) {
    _defaultWarehouse = json['defaultWarehouse'] != null ? DefaultWarehouse.fromJson(json['defaultWarehouse']) : null;
    if (json['allowWarehouses'] != null) {
      _allowWarehouses = [];
      json['allowWarehouses'].forEach((v) {
        _allowWarehouses?.add(AllowWarehouses.fromJson(v));
      });
    }
  }
  DefaultWarehouse? _defaultWarehouse;
  List<AllowWarehouses>? _allowWarehouses;

  DefaultWarehouse? get defaultWarehouse => _defaultWarehouse;
  List<AllowWarehouses>? get allowWarehouses => _allowWarehouses;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_defaultWarehouse != null) {
      map['defaultWarehouse'] = _defaultWarehouse?.toJson();
    }
    if (_allowWarehouses != null) {
      map['allowWarehouses'] = _allowWarehouses?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "Garonor"
/// abbreviation : "EP_GAR"

class AllowWarehouses {
  AllowWarehouses({
      String? name, 
      String? abbreviation,}){
    _name = name;
    _abbreviation = abbreviation;
}

  AllowWarehouses.fromJson(dynamic json) {
    _name = json['name'];
    _abbreviation = json['abbreviation'];
  }
  String? _name;
  String? _abbreviation;

  String? get name => _name;
  String? get abbreviation => _abbreviation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['abbreviation'] = _abbreviation;
    return map;
  }

}

/// name : "Garonor"
/// abbreviation : "EP_GAR"

class DefaultWarehouse {
  DefaultWarehouse({
      String? name, 
      String? abbreviation,}){
    _name = name;
    _abbreviation = abbreviation;
}

  DefaultWarehouse.fromJson(dynamic json) {
    _name = json['name'];
    _abbreviation = json['abbreviation'];
  }
  String? _name;
  String? _abbreviation;

  String? get name => _name;
  String? get abbreviation => _abbreviation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['abbreviation'] = _abbreviation;
    return map;
  }

}
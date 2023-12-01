/// error : null
/// response : {"data":{"userId":23,"first_name":"Himanshu","last_name":"Y","profile_image_url":"https://temocare-dev-bucket1.s3.us-east-2.amazonaws.com/d44a21b9-6fe7-466d-b03f-69ac06cead11.jpg","is_active":true,"will_show_questions":false,"is_daily_pain_level_submitted":false,"email":"himanshuyadav696@gmail.com","age":"20","deviceType":1,"deviceToken":"abc123","userType":"patient","gender":"male","accessToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAxNTM4ODA4LCJpYXQiOjE3MDExMDY4MDgsImp0aSI6IjdkOTQ2MGQxZWYwODQ5YTBhZTc5NjYwMzM1ZDE1ZDBjIiwidXNlcl9pZCI6MjN9.nglOzqIOAOFie0GLLSLtDZjZkDRrc0FZsZVuWonL5Wo","refreshToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMTUzODgwOCwiaWF0IjoxNzAxMTA2ODA4LCJqdGkiOiI5YjYzM2VlOTcwMGM0NmYyYmI1OTAxY2ZmODFmYjgxMCIsInVzZXJfaWQiOjIzfQ.vb-qIuS8C87tZCZ7YEzB3zxL04gC3yuHjpkAai8dMdg","banner_image_url":"https://temocare.com/static/dist/img/banner-home.jpg"},"message":{"success":true,"successCode":200,"statusCode":200,"successMessage":"User Logged in successfully."}}

class UserData {
  UserData({
      dynamic error,
      Response? response,}){
    _error = error;
    _response = response;
}

  UserData.fromJson(dynamic json) {
    _error = json['error'];
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  dynamic _error;
  Response? _response;
UserData copyWith({  dynamic error,
  Response? response,
}) => UserData(  error: error ?? _error,
  response: response ?? _response,
);
  dynamic get error => _error;
  Response? get response => _response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = _error;
    if (_response != null) {
      map['response'] = _response?.toJson();
    }
    return map;
  }

}

/// data : {"userId":23,"first_name":"Himanshu","last_name":"Y","profile_image_url":"https://temocare-dev-bucket1.s3.us-east-2.amazonaws.com/d44a21b9-6fe7-466d-b03f-69ac06cead11.jpg","is_active":true,"will_show_questions":false,"is_daily_pain_level_submitted":false,"email":"himanshuyadav696@gmail.com","age":"20","deviceType":1,"deviceToken":"abc123","userType":"patient","gender":"male","accessToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAxNTM4ODA4LCJpYXQiOjE3MDExMDY4MDgsImp0aSI6IjdkOTQ2MGQxZWYwODQ5YTBhZTc5NjYwMzM1ZDE1ZDBjIiwidXNlcl9pZCI6MjN9.nglOzqIOAOFie0GLLSLtDZjZkDRrc0FZsZVuWonL5Wo","refreshToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMTUzODgwOCwiaWF0IjoxNzAxMTA2ODA4LCJqdGkiOiI5YjYzM2VlOTcwMGM0NmYyYmI1OTAxY2ZmODFmYjgxMCIsInVzZXJfaWQiOjIzfQ.vb-qIuS8C87tZCZ7YEzB3zxL04gC3yuHjpkAai8dMdg","banner_image_url":"https://temocare.com/static/dist/img/banner-home.jpg"}
/// message : {"success":true,"successCode":200,"statusCode":200,"successMessage":"User Logged in successfully."}

class Response {
  Response({
      Data? data, 
      Message? message,}){
    _data = data;
    _message = message;
}

  Response.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'] != null ? Message.fromJson(json['message']) : null;
  }
  Data? _data;
  Message? _message;
Response copyWith({  Data? data,
  Message? message,
}) => Response(  data: data ?? _data,
  message: message ?? _message,
);
  Data? get data => _data;
  Message? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (_message != null) {
      map['message'] = _message?.toJson();
    }
    return map;
  }

}

/// success : true
/// successCode : 200
/// statusCode : 200
/// successMessage : "User Logged in successfully."

class Message {
  Message({
      bool? success, 
      num? successCode, 
      num? statusCode, 
      String? successMessage,}){
    _success = success;
    _successCode = successCode;
    _statusCode = statusCode;
    _successMessage = successMessage;
}

  Message.fromJson(dynamic json) {
    _success = json['success'];
    _successCode = json['successCode'];
    _statusCode = json['statusCode'];
    _successMessage = json['successMessage'];
  }
  bool? _success;
  num? _successCode;
  num? _statusCode;
  String? _successMessage;
Message copyWith({  bool? success,
  num? successCode,
  num? statusCode,
  String? successMessage,
}) => Message(  success: success ?? _success,
  successCode: successCode ?? _successCode,
  statusCode: statusCode ?? _statusCode,
  successMessage: successMessage ?? _successMessage,
);
  bool? get success => _success;
  num? get successCode => _successCode;
  num? get statusCode => _statusCode;
  String? get successMessage => _successMessage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['successCode'] = _successCode;
    map['statusCode'] = _statusCode;
    map['successMessage'] = _successMessage;
    return map;
  }

}

/// userId : 23
/// first_name : "Himanshu"
/// last_name : "Y"
/// profile_image_url : "https://temocare-dev-bucket1.s3.us-east-2.amazonaws.com/d44a21b9-6fe7-466d-b03f-69ac06cead11.jpg"
/// is_active : true
/// will_show_questions : false
/// is_daily_pain_level_submitted : false
/// email : "himanshuyadav696@gmail.com"
/// age : "20"
/// deviceType : 1
/// deviceToken : "abc123"
/// userType : "patient"
/// gender : "male"
/// accessToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAxNTM4ODA4LCJpYXQiOjE3MDExMDY4MDgsImp0aSI6IjdkOTQ2MGQxZWYwODQ5YTBhZTc5NjYwMzM1ZDE1ZDBjIiwidXNlcl9pZCI6MjN9.nglOzqIOAOFie0GLLSLtDZjZkDRrc0FZsZVuWonL5Wo"
/// refreshToken : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcwMTUzODgwOCwiaWF0IjoxNzAxMTA2ODA4LCJqdGkiOiI5YjYzM2VlOTcwMGM0NmYyYmI1OTAxY2ZmODFmYjgxMCIsInVzZXJfaWQiOjIzfQ.vb-qIuS8C87tZCZ7YEzB3zxL04gC3yuHjpkAai8dMdg"
/// banner_image_url : "https://temocare.com/static/dist/img/banner-home.jpg"

class Data {
  Data({
      num? userId, 
      String? firstName, 
      String? lastName, 
      String? profileImageUrl, 
      bool? isActive, 
      bool? willShowQuestions, 
      bool? isDailyPainLevelSubmitted, 
      String? email, 
      String? age, 
      num? deviceType, 
      String? deviceToken, 
      String? userType, 
      String? gender, 
      String? accessToken, 
      String? refreshToken, 
      String? bannerImageUrl,}){
    _userId = userId;
    _firstName = firstName;
    _lastName = lastName;
    _profileImageUrl = profileImageUrl;
    _isActive = isActive;
    _willShowQuestions = willShowQuestions;
    _isDailyPainLevelSubmitted = isDailyPainLevelSubmitted;
    _email = email;
    _age = age;
    _deviceType = deviceType;
    _deviceToken = deviceToken;
    _userType = userType;
    _gender = gender;
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    _bannerImageUrl = bannerImageUrl;
}

  Data.fromJson(dynamic json) {
    _userId = json['userId'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _profileImageUrl = json['profile_image_url'];
    _isActive = json['is_active'];
    _willShowQuestions = json['will_show_questions'];
    _isDailyPainLevelSubmitted = json['is_daily_pain_level_submitted'];
    _email = json['email'];
    _age = json['age'];
    _deviceType = json['deviceType'];
    _deviceToken = json['deviceToken'];
    _userType = json['userType'];
    _gender = json['gender'];
    _accessToken = json['accessToken'];
    _refreshToken = json['refreshToken'];
    _bannerImageUrl = json['banner_image_url'];
  }
  num? _userId;
  String? _firstName;
  String? _lastName;
  String? _profileImageUrl;
  bool? _isActive;
  bool? _willShowQuestions;
  bool? _isDailyPainLevelSubmitted;
  String? _email;
  String? _age;
  num? _deviceType;
  String? _deviceToken;
  String? _userType;
  String? _gender;
  String? _accessToken;
  String? _refreshToken;
  String? _bannerImageUrl;
Data copyWith({  num? userId,
  String? firstName,
  String? lastName,
  String? profileImageUrl,
  bool? isActive,
  bool? willShowQuestions,
  bool? isDailyPainLevelSubmitted,
  String? email,
  String? age,
  num? deviceType,
  String? deviceToken,
  String? userType,
  String? gender,
  String? accessToken,
  String? refreshToken,
  String? bannerImageUrl,
}) => Data(  userId: userId ?? _userId,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  profileImageUrl: profileImageUrl ?? _profileImageUrl,
  isActive: isActive ?? _isActive,
  willShowQuestions: willShowQuestions ?? _willShowQuestions,
  isDailyPainLevelSubmitted: isDailyPainLevelSubmitted ?? _isDailyPainLevelSubmitted,
  email: email ?? _email,
  age: age ?? _age,
  deviceType: deviceType ?? _deviceType,
  deviceToken: deviceToken ?? _deviceToken,
  userType: userType ?? _userType,
  gender: gender ?? _gender,
  accessToken: accessToken ?? _accessToken,
  refreshToken: refreshToken ?? _refreshToken,
  bannerImageUrl: bannerImageUrl ?? _bannerImageUrl,
);
  num? get userId => _userId;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get profileImageUrl => _profileImageUrl;
  bool? get isActive => _isActive;
  bool? get willShowQuestions => _willShowQuestions;
  bool? get isDailyPainLevelSubmitted => _isDailyPainLevelSubmitted;
  String? get email => _email;
  String? get age => _age;
  num? get deviceType => _deviceType;
  String? get deviceToken => _deviceToken;
  String? get userType => _userType;
  String? get gender => _gender;
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  String? get bannerImageUrl => _bannerImageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = _userId;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['profile_image_url'] = _profileImageUrl;
    map['is_active'] = _isActive;
    map['will_show_questions'] = _willShowQuestions;
    map['is_daily_pain_level_submitted'] = _isDailyPainLevelSubmitted;
    map['email'] = _email;
    map['age'] = _age;
    map['deviceType'] = _deviceType;
    map['deviceToken'] = _deviceToken;
    map['userType'] = _userType;
    map['gender'] = _gender;
    map['accessToken'] = _accessToken;
    map['refreshToken'] = _refreshToken;
    map['banner_image_url'] = _bannerImageUrl;
    return map;
  }

}
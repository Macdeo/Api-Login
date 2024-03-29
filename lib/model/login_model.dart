class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({this.token, this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }

  Map<String, dynamic> tojson(){
    Map<String, dynamic> map = {
      'token': token.trim(),
      'error': error.trim()
    };
    return map;
  }
}

class LoginRequestModel {
  String username;
  String password;

  LoginRequestModel({
    this.username,
    this.password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': username.trim(),
      'password': password.trim(),
    };
    return map;
  }
}

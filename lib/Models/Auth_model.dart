class AuthModel {
  final String message;
  final bool statusCode;

  AuthModel({required this.message, required this.statusCode});
  
  factory AuthModel.fromjson(Map<String, dynamic> json) {
    return AuthModel(
      message: json["message"],
     statusCode: json["statusCode"])
     ;
  }
}

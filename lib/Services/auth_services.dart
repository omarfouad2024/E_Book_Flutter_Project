import 'package:dio/dio.dart';
import 'package:e_book_flutter_project/Models/Auth_model.dart';

class Authservices {
  static Dio dio = Dio();
  static Future<AuthModel> Login({
    required String email,
    required String Password,
  }) async {
    try {
      Response response = await dio.post(
        "https://librarysystemflutterteam.runasp.net/api/Registration/SignIn",
        data: {"email": email, "password": Password},
      );
      return AuthModel.fromjson(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
  static Future<AuthModel> SignUp({
    required String name,
    required String email,
    required String Password,
    required String phoneNumber,
  }) async {
    try {
      Response response = await dio.post(
        "https://librarysystemflutterteam.runasp.net/api/Registration/SignUp",
        data: {
        "name":name,
        "email": email,
        "password": Password,
        "phoneNumber": phoneNumber
        },
      );
      return AuthModel.fromjson(response.data);
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}

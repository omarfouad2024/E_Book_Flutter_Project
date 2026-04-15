import 'package:e_book_flutter_project/Models/Auth_model.dart';
import 'package:e_book_flutter_project/Services/auth_services.dart';
import 'package:flutter/material.dart';
class Authprovider extends ChangeNotifier {
  AuthModel? model;

  Future<void> Login({required String email, required String Password}) async {
    model = await Authservices.Login(email: email, Password: Password);
    notifyListeners();
  }

  Future<void> SignUp({
    required String name,
    required String email,
    required String Password,
    required String phoneNumber,
  }) async {
    model = await Authservices.SignUp(
      name: name,
      email: email,
      Password: Password,
      phoneNumber: phoneNumber,
    );
    notifyListeners();
  }
}

import "package:amazon/constants/error_handling.dart";
import "package:amazon/constants/global_variables.dart";
import "package:amazon/constants/utils.dart";
import "package:amazon/models/user.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandling(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Account successfully created.');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

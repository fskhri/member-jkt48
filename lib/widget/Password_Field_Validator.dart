import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class PasswordValidator {
  static String(BuildContext context, password) {
    final TextEditingController controller = TextEditingController();
    FlutterPwValidator validator = FlutterPwValidator(
      minLength: 8,
      uppercaseCharCount: 1,
      numericCharCount: 1,
      specialCharCount: 1,
      width: 300,
      height: 200,
      controller: controller,
      onSuccess: () {
        print("MATCHED");
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Password is matched")));
      },
      onFail: () {
        print("NOT MATCHED");
      },
    );
  }
}

import 'package:intl/intl.dart';

class ValidatorUtils {
  static String? usernameValidator(String? username) {
    if (username == null || username.isEmpty) {
      return 'This field cannot be empty';
    }

    // Regular expressions for email and phone number
    // final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    // final phoneRegex = RegExp(r'^\d{10}$'); // Assuming a 10-digit phone number

    // if (!emailRegex.hasMatch(username) && !phoneRegex.hasMatch(username)) {
    //   return 'Invalid format. Please enter a valid email or phone number.';
    // }

    if (username.length < 6) {
      return 'Username must 6 charactor';
    }
    return null;
  }

  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return 'This field cannot be empty';
    }
    final emailRegex = RegExp(
        r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'); // Assuming a 10-digit phone number

    if (!emailRegex.hasMatch(email)) {
      return 'Invalid format. Please enter a valid email or phone number.';
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'This field cannot be empty';
    }
    if (password.length < 6) {
      return 'Password must 6 charactor';
    }
    return null;
  }

  static String? phoneValidator(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'This field cannot be empty';
    }

    final phoneRegex = RegExp(r'^\d{10}$'); // Assuming a 10-digit phone number

    if (!phoneRegex.hasMatch(phoneNumber)) {
      return 'Invalid format. Please enter a valid phone number.';
    }

    return null;
  }

  static String? nameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return 'This field cannot be empty';
    }
    final nameRegex = RegExp('[a-zA-Z]');
    if (!nameRegex.hasMatch(name)) {
      return 'Invalid format. Please enter a valid name.';
    }
    return null;
  }


}

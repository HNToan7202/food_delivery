// Form Error
// ignore_for_file: constant_identifier_names
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';

const String apiKey = "AIzaSyDj1yetEGyYm68nzNFEoIHaxvlHaoRv5HA";

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

const String kTextSignUp = "Sign Up";
const String kYourCourses = "Your Courses";
const String kTextCreateAccount = "Create your account";

const String kTextCourse = "Course";
const String kTextProfile = "Profile";
const String kTextSettings = "Settings";
const String kTextNotification = "Notifications";
const String kAccountInformation = "Account information";
const String kContentCourse = "You can launch a new career in web develop-"
    "ment today by learning HTML & CSS."
    "You don't need a computer science "
    "degree or expensive software. All "
    "you need is a computer, a bit of time,"
    " a lot of determination, and a teacher you trust.";
const String kTagForHeader = "Tags For Headers";

const String accountDB = "ACCOUNT";

const kAnimationDuration = Duration(milliseconds: 200);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide: const BorderSide(color: AppColorScheme.inkDarkGray),
  );
}

class DBConstants {
  static const String ACCOUNT = "ACCOUNTS";
  static const String USER_PROFILE = "USER_PROFILE";
  static const String baseUrl = "https://65266d6d917d673fd76c3c0b.mockapi.io/";
}

class MoneyUtils {
  static String vndDong(double amount) {
    NumberFormat vietnameseDongFormat =
        NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
    return vietnameseDongFormat.format(amount);
  }
}

// String md5X(String password) =>
//     hex.encode(md5.convert(utf8.encode(password)).bytes);
// >>>>>>> 867f49b (feat: user profile)

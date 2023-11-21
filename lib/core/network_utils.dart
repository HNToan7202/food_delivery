import 'dart:io';

import 'package:dio/dio.dart';
import 'package:food_delivery/common/constants.dart';

class NetWorkUtili {
  static Future<bool> check() async {
    try {
      final result =
          await InternetAddress.lookup('https://maps.googleapis.com/');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) return true;
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  static Future<String> getPlaceAutoComplete(String query) async {
    final res = await Dio().get(
      "https://maps.googleapis.com/maps/api/place/autocomplete/json",
      queryParameters: {"input": query, "key": apiKey},
    );
    if (res.statusCode == 200) {
      return res.data.toString();
    }
    return "";
  }
}

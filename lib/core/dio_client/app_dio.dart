// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class AppDio {
  late final Dio dio;
  AppDio({required Dio intialDio}) {
    dio = initDio(intialDio);
  }

  Dio initDio(Dio dio) {
    return dio;
  }
}

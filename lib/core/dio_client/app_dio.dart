// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class AppDio {
  late final Dio dio;
  AppDio({required Dio intialDio}) {
    dio = initDio(intialDio);
  }

  Dio initDio(Dio dio) {
    dio.options.baseUrl = "https://foods-delivery.azurewebsites.net/api";
    dio.interceptors.add(InterceptorsWrapper(
      onRequest:
          (RequestOptions requestOptions, RequestInterceptorHandler handler) {},
      onError: ((e, handler) {
        if (e.response?.statusCode == 401) {
          //Trả về trang login
          
        }
      }),
    ));
    return dio;
  }
}

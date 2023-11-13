// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';

import '../models/common_request_body.dart';
import '../models/common_response.dart';

abstract class ApiService {
  Future<CommonResponse<T>>
      get<Request extends CommonRequsetBody, T extends Object>({
    required String path,
    required Request? params,
    T? Function(Map<String, dynamic> map)? tFromMap,
  });

  Future<CommonResponse<T>>
      post<Request extends CommonRequsetBody, T extends Object>({
    required String path,
    required Request? requestBody,
    T? Function(Map<String, dynamic> map)? tFromMap,
  });

  Future<CommonResponse<T>>
      put<Request extends CommonRequsetBody, T extends Object>({
    required String path,
    required Request? requestBody,
    T? Function(Map<String, dynamic> map)? tFromMap,
  });

  Future<CommonResponse<T>>
      patch<Request extends CommonRequsetBody, T extends Object>({
    required String path,
    required Request? requestBody,
    T? Function(Map<String, dynamic> map)? tFromMap,
  });

  Future<CommonResponse<T>>
      delete<Request extends CommonRequsetBody, T extends Object>({
    required String path,
    required Request? requestBody,
    T? Function(Map<String, dynamic> map)? tFromMap,
  });

  CommonResponse<T> handleResponse<T extends Object>(
    Response response, {
    T? Function(Map<String, dynamic> map)? tFromMap,
  });
}

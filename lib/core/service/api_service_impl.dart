// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../models/common_request_body.dart';
import '../models/common_response.dart';
import 'api_service.dart';

class ApiServiceImpl implements ApiService {
  final Dio dio;
  ApiServiceImpl({
    required this.dio,
  });

  @override
  Future<CommonResponse<T>>
      delete<Request extends CommonRequsetBody, T extends Object>({
    required String path,
    required Request? requestBody,
    T? Function(Map<String, dynamic> map)? tFromMap,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<CommonResponse<T>>
      patch<Request extends CommonRequsetBody, T extends Object>({
    required String path,
    required Request? requestBody,
    T? Function(Map<String, dynamic> map)? tFromMap,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<CommonResponse<T>>
      get<Request extends CommonRequsetBody, T extends Object>({
    required String path,
    required Request? params,
    T? Function(Map<String, dynamic> map)? tFromMap,
  }) async {
    late final Response response;
    final Dio dioX = dio
      ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ));
    final Map<String, dynamic> queryParameters = params?.toMap() ?? {};
    if (queryParameters.containsKey('accessToken')) {
      dioX.options.headers.addAll(
          {'Authorization': 'Bearer ${queryParameters['accessToken']}'});
      queryParameters.remove('accessToken');
    }

    try {
      response = await dioX.get(path, queryParameters: queryParameters);
      return handleResponse(response, tFromMap: tFromMap);
    } catch (e) {
      return ObjectErrorResponse(message: e.toString());
    }
  }

  @override
  Future<CommonResponse<T>>
      post<Request extends CommonRequsetBody, T extends Object>({
    required String path,
    required Request? requestBody,
    T? Function(Map<String, dynamic> map)? tFromMap,
  }) async {
    late final Response response;
    final Dio dioX = dio
      ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
      ));
    final Map<String, dynamic> dataMap = requestBody?.toMap() ?? {};
    if (dataMap.containsKey('accessToken')) {
      dioX.options.headers
          .addAll({'Authorization': 'Bearer ${dataMap['accessToken']}'});
      dataMap.remove('accessToken');
    }
    try {
      response = await dioX.post(path, data: dataMap == {} ? null : dataMap);
      return handleResponse(response, tFromMap: tFromMap);
    } catch (e) {
      return ObjectErrorResponse(message: e.toString());
    }
  }

  @override
  Future<CommonResponse<T>>
      put<Request extends CommonRequsetBody, T extends Object>({
    required String path,
    required Request? requestBody,
    T? Function(Map<String, dynamic> map)? tFromMap,
  }) {
    throw UnimplementedError();
  }

  @override
  CommonResponse<T> handleResponse<T extends Object>(
    Response response, {
    T? Function(Map<String, dynamic> map)? tFromMap,
  }) {
    try {
      final Map<String, dynamic> mapData = jsonDecode(
        jsonEncode(response.data),
      );
      if (mapData['code'] == 200 && response.statusCode == 200) {
        return SuccessRessponse<T>.fromMap(
            mapData, (mapT) => tFromMap?.call(mapData['data']));
      } else {
        return NetworkErrorResponse.fromMap(
          jsonDecode(
            jsonEncode(response.data),
          ),
        );
      }
    } catch (e, stackTree) {
      print("LLLLLL");
      print(e);
      print(stackTree);
      return ObjectErrorResponse(message: "Lỗi parse object");
    }
  }
}

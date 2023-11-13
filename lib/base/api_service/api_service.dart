import 'package:dio/dio.dart';

import '../models/api_res.dart';

abstract class BaseApiService {
  ApiResponse<T> handleResponse<T>(
    Response response,
    T Function(Object? obj)? fromJsonT,
  );

  Future<ApiResponse<T>> get<Req, T>({
    required String path,
    required Req body,
    T Function(Object? obj)? fromJsonT,
  });

  Future<ApiResponse<T>> post<Req, T>({
    required String path,
    required Req body,
    T Function(Object? obj)? fromJsonT,
  });

  Future<ApiResponse<T>> put<Req, T>({
    required String path,
    required Req body,
    T Function(Object? obj)? fromJsonT,
  });

  Future<ApiResponse<T>> patch<Req, T>({
    required String path,
    required Req body,
    T Function(Object? obj)? fromJsonT,
  });

  Future<ApiResponse<T>> delete<Req, T>({
    required String path,
    required Req body,
    T Function(Object? obj)? fromJsonT,
  });
}

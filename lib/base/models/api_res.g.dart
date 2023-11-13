// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SuccessRes<T> _$$SuccessResFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$SuccessRes<T>(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      time: json['time'] as int,
      data: fromJsonT(json['data']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SuccessResToJson<T>(
  _$SuccessRes<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'time': instance.time,
      'data': toJsonT(instance.data),
      'runtimeType': instance.$type,
    };

_$ErrorRes<T> _$$ErrorResFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$ErrorRes<T>(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String,
      time: json['time'] as int,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ErrorResToJson<T>(
  _$ErrorRes<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
      'time': instance.time,
      'runtimeType': instance.$type,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryEntity _$$_CategoryEntityFromJson(Map<String, dynamic> json) =>
    _$_CategoryEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      image: json['image'] as String,
      itemCount: json['itemCount'] as int,
    );

Map<String, dynamic> _$$_CategoryEntityToJson(_$_CategoryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'image': instance.image,
      'itemCount': instance.itemCount,
    };

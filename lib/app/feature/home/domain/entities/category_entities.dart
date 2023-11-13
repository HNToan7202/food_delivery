import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_entities.freezed.dart';
part 'category_entities.g.dart';

@freezed
class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    required String id,
    required String name,
    required String code,
    required String image,
    required int itemCount,
  }) = _CategoryEntity;

  factory CategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$CategoryEntityFromJson(json);
}

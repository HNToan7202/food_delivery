import 'dart:convert';

import '../../../../../core/models/common_response.dart';

class CategoriesResponse<CategoriesResponseData> extends SuccessRessponse {
  CategoriesResponse(
      {required super.status,
      required super.message,
      required super.code,
      required super.time,
      required super.data});

  @override
  factory CategoriesResponse.fromMap(Map<String, dynamic> map,
      {required CategoriesResponseData Function(Map<String, dynamic> map)?
          tFromJson}) {
    return CategoriesResponse<CategoriesResponseData>(
      status: map['status'],
      message: map['message'],
      code: map['code'],
      time: map['time'],
      data: map['data'] == null
          ? null
          : tFromJson?.call(
              jsonDecode(
                jsonEncode(map['data']),
              ),
            ),
    );
  }
}

class CategoriesResponseData {
  final int totalItems;
  final int totalPages;
  final List<Category> categories;
  final int currentPage;

  CategoriesResponseData({
    required this.totalItems,
    required this.totalPages,
    required this.categories,
    required this.currentPage,
  });

  CategoriesResponseData copyWith({
    int? totalItems,
    int? totalPages,
    List<Category>? categories,
    int? currentPage,
  }) =>
      CategoriesResponseData(
        totalItems: totalItems ?? this.totalItems,
        totalPages: totalPages ?? this.totalPages,
        categories: categories ?? this.categories,
        currentPage: currentPage ?? this.currentPage,
      );

  factory CategoriesResponseData.fromJson(Map<String, dynamic> json) =>
      CategoriesResponseData(
        totalItems: json["totalItems"],
        totalPages: json["totalPages"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        currentPage: json["currentPage"],
      );

  factory CategoriesResponseData.fromMap(Map<String, dynamic> map) {
    return CategoriesResponseData(
      totalItems: map["totalItems"],
      totalPages: map["totalPages"],
      categories: List<Category>.from(map["categories"]
          .map((categoryMap) => Category.fromMap(categoryMap))),
      currentPage: map["currentPage"],
    );
  }
  Map<String, dynamic> toJson() => {
        "totalItems": totalItems,
        "totalPages": totalPages,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "currentPage": currentPage,
      };
}

class Category {
  final String id;
  final String name;
  final String code;
  final String image;
  final int itemCount;

  Category({
    required this.id,
    required this.name,
    required this.code,
    required this.image,
    required this.itemCount,
  });

  Category copyWith({
    String? id,
    String? name,
    String? code,
    String? image,
    int? itemCount,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        image: image ?? this.image,
        itemCount: itemCount ?? this.itemCount,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        image: json["image"],
        itemCount: json["itemCount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "image": image,
        "itemCount": itemCount,
      };
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map["id"],
      name: map["name"],
      code: map["code"],
      image: map["image"],
      itemCount: map["itemCount"],
    );
  }
}

import 'dart:convert';

import 'package:food_delivery/app/feature/dish/data/model/dish_model.dart';
import 'package:food_delivery/core/models/common_response.dart';

class DishResponse<DishResponseData> extends SuccessRessponse {
  DishResponse(
      {required super.status,
      required super.message,
      required super.code,
      required super.time,
      required super.data});
  @override
  factory DishResponse.fromMap(Map<String, dynamic> map,
      {required DishResponseData Function(Map<String, dynamic> map)?
          tFromJson}) {
    return DishResponse<DishResponseData>(
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

class DishResponseData {
  final DishCategory dishCategory;
  final int totalItems;
  final List<Dish> dish;
  final int totalPages;
  final int currentPage;

  DishResponseData({
    required this.dishCategory,
    required this.totalItems,
    required this.dish,
    required this.totalPages,
    required this.currentPage,
  });

  DishResponseData copyWith({
    DishCategory? dishCategory,
    int? totalItems,
    List<Dish>? dish,
    int? totalPages,
    int? currentPage,
  }) =>
      DishResponseData(
        dishCategory: dishCategory ?? this.dishCategory,
        totalItems: totalItems ?? this.totalItems,
        dish: dish ?? this.dish,
        totalPages: totalPages ?? this.totalPages,
        currentPage: currentPage ?? this.currentPage,
      );

  factory DishResponseData.fromMap(Map<String, dynamic> map) {
    return DishResponseData(
      dishCategory: DishCategory.fromMap(map["dishCategory"]),
      totalItems: map["totalItems"],
      dish: List<Dish>.from(map["dish"].map((x) => Dish.fromMap(x))),
      totalPages: map["totalPages"],
      currentPage: map["currentPage"],
    );
  }

  factory DishResponseData.fromJson(Map<String, dynamic> json) =>
      DishResponseData(
        dishCategory: DishCategory.fromJson(json["dishCategory"]),
        totalItems: json["totalItems"],
        dish: List<Dish>.from(json["dish"].map((x) => Dish.fromJson(x))),
        totalPages: json["totalPages"],
        currentPage: json["currentPage"],
      );

  Map<String, dynamic> toJson() => {
        "dishCategory": dishCategory.toJson(),
        "totalItems": totalItems,
        "dish": List<dynamic>.from(dish.map((x) => x.toJson())),
        "totalPages": totalPages,
        "currentPage": currentPage,
      };
}


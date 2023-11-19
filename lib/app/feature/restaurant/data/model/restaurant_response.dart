import 'dart:convert';

import 'package:food_delivery/app/feature/restaurant/data/model/restaurant_model.dart';
import 'package:food_delivery/core/models/common_response.dart';

class RestaurantResponse<RestaurantData> extends SuccessRessponse {
  RestaurantResponse(
      {required super.status,
      required super.message,
      required super.code,
      required super.time,
      required super.data});

  @override
  factory RestaurantResponse.fromMap(Map<String, dynamic> map,
      {required RestaurantData Function(Map<String, dynamic> map)? tFromJson}) {
    return RestaurantResponse<RestaurantData>(
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

class RestaurantData {
  final int totalItems;
  final int totalPages;
  final List<Restaurant> restaurants;
  final int currentPage;

  RestaurantData({
    required this.totalItems,
    required this.totalPages,
    required this.restaurants,
    required this.currentPage,
  });

  RestaurantData copyWith({
    int? totalItems,
    int? totalPages,
    List<Restaurant>? restaurants,
    int? currentPage,
  }) =>
      RestaurantData(
        totalItems: totalItems ?? this.totalItems,
        totalPages: totalPages ?? this.totalPages,
        restaurants: restaurants ?? this.restaurants,
        currentPage: currentPage ?? this.currentPage,
      );

  factory RestaurantData.fromJson(Map<String, dynamic> json) => RestaurantData(
        totalItems: json["totalItems"],
        totalPages: json["totalPages"],
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromJson(x))),
        currentPage: json["currentPage"],
      );

  Map<String, dynamic> toJson() => {
        "totalItems": totalItems,
        "totalPages": totalPages,
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
        "currentPage": currentPage,
      };
}

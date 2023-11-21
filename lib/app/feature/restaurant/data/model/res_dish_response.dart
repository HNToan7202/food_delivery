import 'package:food_delivery/core/models/common_response.dart';
import 'dart:convert';

class ResDishResponse<ResDishResponseData> extends SuccessRessponse {
  ResDishResponse(
      {required super.status,
      required super.message,
      required super.code,
      required super.time,
      required super.data});

  @override
  factory ResDishResponse.fromMap(Map<String, dynamic> map,
      {required ResDishResponseData Function(Map<String, dynamic> map)?
          tFromJson}) {
    return ResDishResponse<ResDishResponseData>(
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

// To parse this JSON data, do
//
//     final resDishResponseData = resDishResponseDataFromJson(jsonString);

class ResDishResponseData {
  final int totalItems;
  final Restaurant restaurant;
  final int totalPages;
  final List<Dish> dishes;
  final int currentPage;

  ResDishResponseData({
    required this.totalItems,
    required this.restaurant,
    required this.totalPages,
    required this.dishes,
    required this.currentPage,
  });

  ResDishResponseData copyWith({
    int? totalItems,
    Restaurant? restaurant,
    int? totalPages,
    List<Dish>? dishes,
    int? currentPage,
  }) =>
      ResDishResponseData(
        totalItems: totalItems ?? this.totalItems,
        restaurant: restaurant ?? this.restaurant,
        totalPages: totalPages ?? this.totalPages,
        dishes: dishes ?? this.dishes,
        currentPage: currentPage ?? this.currentPage,
      );

  factory ResDishResponseData.fromJson(Map<String, dynamic> json) =>
      ResDishResponseData(
        totalItems: json["totalItems"],
        restaurant: Restaurant.fromJson(json["restaurant"]),
        totalPages: json["totalPages"],
        dishes: List<Dish>.from(json["dishes"].map((x) => Dish.fromJson(x))),
        currentPage: json["currentPage"],
      );

  Map<String, dynamic> toJson() => {
        "totalItems": totalItems,
        "restaurant": restaurant.toJson(),
        "totalPages": totalPages,
        "dishes": List<dynamic>.from(dishes.map((x) => x.toJson())),
        "currentPage": currentPage,
      };
}

class Dish {
  final String id;
  final String name;
  final String description;
  final String image;
  final String status;
  final int quantity;
  final double price;
  final String categoryName;

  Dish({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.status,
    required this.quantity,
    required this.price,
    required this.categoryName,
  });

  Dish copyWith({
    String? id,
    String? name,
    String? description,
    String? image,
    String? status,
    int? quantity,
    double? price,
    String? categoryName,
  }) =>
      Dish(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
        status: status ?? this.status,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
        categoryName: categoryName ?? this.categoryName,
      );

  factory Dish.fromJson(Map<String, dynamic> json) => Dish(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        status: json["status"],
        quantity: json["quantity"],
        price: json["price"],
        categoryName: json["categoryName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "status": status,
        "quantity": quantity,
        "price": price,
        "categoryName": categoryName,
      };
}

class Restaurant {
  final String id;
  final String name;
  final String address;
  final String phone;
  final String email;
  final String description;
  final String logo;
  final DateTime createdAt;

  Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.description,
    required this.logo,
    required this.createdAt,
  });

  Restaurant copyWith({
    String? id,
    String? name,
    String? address,
    String? phone,
    String? email,
    String? description,
    String? logo,
    DateTime? createdAt,
  }) =>
      Restaurant(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        description: description ?? this.description,
        logo: logo ?? this.logo,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        email: json["email"],
        description: json["description"],
        logo: json["logo"],
        createdAt: DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "phone": phone,
        "email": email,
        "description": description,
        "logo": logo,
        "createdAt": createdAt.toIso8601String(),
      };
}

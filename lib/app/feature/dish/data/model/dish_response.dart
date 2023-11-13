import 'dart:convert';

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

class Dish {
  final String id;
  final String name;
  final String description;
  final dynamic image;
  final int price;
  final int quantity;
  final int quantityOrder;
  final int quantitySold;
  final String status;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  Dish({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.quantity,
    required this.quantityOrder,
    required this.quantitySold,
    required this.status,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  Dish copyWith({
    String? id,
    String? name,
    String? description,
    dynamic image,
    int? price,
    int? quantity,
    int? quantityOrder,
    int? quantitySold,
    String? status,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Dish(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        quantityOrder: quantityOrder ?? this.quantityOrder,
        quantitySold: quantitySold ?? this.quantitySold,
        status: status ?? this.status,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Dish.fromMap(Map<String, dynamic> map) {
    return Dish(
      id: map["id"],
      name: map["name"],
      description: map["description"],
      image: map["image"],
      price: map["price"],
      quantity: map["quantity"],
      quantityOrder: map["quantityOrder"],
      quantitySold: map["quantitySold"],
      status: map["status"],
      isActive: map["isActive"],
      createdAt: DateTime.parse(map["createdAt"]),
      updatedAt: DateTime.parse(map["updatedAt"]),
    );
  }

  factory Dish.fromJson(Map<String, dynamic> json) => Dish(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        price: json["price"],
        quantity: json["quantity"],
        quantityOrder: json["quantityOrder"],
        quantitySold: json["quantitySold"],
        status: json["status"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "price": price,
        "quantity": quantity,
        "quantityOrder": quantityOrder,
        "quantitySold": quantitySold,
        "status": status,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class DishCategory {
  final String id;
  final String name;
  final String code;
  final String image;
  final bool isActive;
  final DateTime createdAt;
  final dynamic updatedAt;

  DishCategory({
    required this.id,
    required this.name,
    required this.code,
    required this.image,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DishCategory.fromMap(Map<String, dynamic> map) {
    return DishCategory(
      id: map["id"],
      name: map["name"],
      code: map["code"],
      image: map["image"],
      isActive: map["isActive"],
      createdAt: DateTime.parse(map["createdAt"]),
      updatedAt: map["updatedAt"],
    );
  }

  DishCategory copyWith({
    String? id,
    String? name,
    String? code,
    String? image,
    bool? isActive,
    DateTime? createdAt,
    dynamic updatedAt,
  }) =>
      DishCategory(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        image: image ?? this.image,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory DishCategory.fromJson(Map<String, dynamic> json) => DishCategory(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        image: json["image"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "image": image,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt,
      };
}

import 'dart:convert';
import 'package:food_delivery/core/models/common_response.dart';

class SearchResponse<SearchResponseData> extends SuccessRessponse {
  SearchResponse(
      {required super.status,
      required super.message,
      required super.code,
      required super.time,
      required super.data});

  @override
  factory SearchResponse.fromMap(Map<String, dynamic> map,
      {required SearchResponseData Function(Map<String, dynamic> map)?
          tFromJson}) {
    return SearchResponse<SearchResponseData>(
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

class SearchResponseData {
  final int? totalItems;
  final List<Restaurant>? restaurant;

  SearchResponseData({
    this.totalItems,
    this.restaurant,
  });

  SearchResponseData copyWith({
    int? totalItems,
    List<Restaurant>? restaurant,
  }) =>
      SearchResponseData(
        totalItems: totalItems ?? this.totalItems,
        restaurant: restaurant ?? this.restaurant,
      );

  factory SearchResponseData.fromJson(Map<String, dynamic> json) =>
      SearchResponseData(
        totalItems: json["totalItems"],
        restaurant: json["restaurant"] == null
            ? []
            : List<Restaurant>.from(
                json["restaurant"]!.map((x) => Restaurant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "totalItems": totalItems,
        "restaurant": restaurant == null
            ? []
            : List<dynamic>.from(restaurant!.map((x) => x.toJson())),
      };
}

class Restaurant {
  final String? id;
  final String? name;
  final String? address;
  final String? phone;
  final String? email;
  final String? logo;
  final double? rating;
  final List<Dish>? dishes;

  Restaurant({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.email,
    this.logo,
    this.rating,
    this.dishes,
  });

  Restaurant copyWith({
    String? id,
    String? name,
    String? address,
    String? phone,
    String? email,
    String? logo,
    double? rating,
    List<Dish>? dishes,
  }) =>
      Restaurant(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        logo: logo ?? this.logo,
        rating: rating ?? this.rating,
        dishes: dishes ?? this.dishes,
      );

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        email: json["email"],
        logo: json["logo"],
        rating: json["rating"],
        dishes: json["dishes"] == null
            ? []
            : List<Dish>.from(json["dishes"]!.map((x) => Dish.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "phone": phone,
        "email": email,
        "logo": logo,
        "rating": rating,
        "dishes": dishes == null
            ? []
            : List<dynamic>.from(dishes!.map((x) => x.toJson())),
      };
}

class Dish {
  final String? id;
  final String? name;
  final String? description;
  final String? image;
  final double? price;
  final int? quantity;
  final int? quantityOrder;
  final int? quantitySold;
  final String? status;
  final bool? isActive;
  final double? rating;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Dish({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.quantity,
    this.quantityOrder,
    this.quantitySold,
    this.status,
    this.isActive,
    this.rating,
    this.createdAt,
    this.updatedAt,
  });

  Dish copyWith({
    String? id,
    String? name,
    String? description,
    String? image,
    double? price,
    int? quantity,
    int? quantityOrder,
    int? quantitySold,
    String? status,
    bool? isActive,
    double? rating,
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
        rating: rating ?? this.rating,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

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
        rating: json["rating"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
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
        "rating": rating,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

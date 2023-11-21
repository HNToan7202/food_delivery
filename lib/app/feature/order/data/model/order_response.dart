import 'dart:convert';

import '../../../../../core/models/common_response.dart';

class OrderResponse<OrderResponseData> extends SuccessRessponse {
  OrderResponse(
      {required super.status,
      required super.message,
      required super.code,
      required super.time,
      required super.data});

  factory OrderResponse.fromMap(Map<String, dynamic> map,
      {required OrderResponseData Function(Map<String, dynamic> map)?
          tFromJson}) {
    return OrderResponse<OrderResponseData>(
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

class OrderResponseData {
  final List<Order> orders;
  final int total;

  OrderResponseData({
    required this.orders,
    required this.total,
  });

  OrderResponseData copyWith({
    List<Order>? orders,
    int? total,
  }) =>
      OrderResponseData(
        orders: orders ?? this.orders,
        total: total ?? this.total,
      );

  factory OrderResponseData.fromJson(Map<String, dynamic> json) =>
      OrderResponseData(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
        "total": total,
      };
}

class Order {
  final String id;
  final DateTime orderDate;
  final String deliveryAddress;
  final String deliveryPhone;
  final String deliveryName;
  final DateTime completeDate;
  final List<Dish> dishes;
  final double totalPrice;
  final String status;
  final String shipperName;
  final dynamic shipperPhone;
  final String restaurantName;
  final String restaurantAddress;
  final String restaurantPhone;
  final String restaurantAvatar;

  Order({
    required this.id,
    required this.orderDate,
    required this.deliveryAddress,
    required this.deliveryPhone,
    required this.deliveryName,
    required this.completeDate,
    required this.dishes,
    required this.totalPrice,
    required this.status,
    required this.shipperName,
    required this.shipperPhone,
    required this.restaurantName,
    required this.restaurantAddress,
    required this.restaurantPhone,
    required this.restaurantAvatar,
  });

  Order copyWith({
    String? id,
    DateTime? orderDate,
    String? deliveryAddress,
    String? deliveryPhone,
    String? deliveryName,
    DateTime? completeDate,
    List<Dish>? dishes,
    double? totalPrice,
    String? status,
    String? shipperName,
    dynamic shipperPhone,
    String? restaurantName,
    String? restaurantAddress,
    String? restaurantPhone,
    String? restaurantAvatar,
  }) =>
      Order(
        id: id ?? this.id,
        orderDate: orderDate ?? this.orderDate,
        deliveryAddress: deliveryAddress ?? this.deliveryAddress,
        deliveryPhone: deliveryPhone ?? this.deliveryPhone,
        deliveryName: deliveryName ?? this.deliveryName,
        completeDate: completeDate ?? this.completeDate,
        dishes: dishes ?? this.dishes,
        totalPrice: totalPrice ?? this.totalPrice,
        status: status ?? this.status,
        shipperName: shipperName ?? this.shipperName,
        shipperPhone: shipperPhone ?? this.shipperPhone,
        restaurantName: restaurantName ?? this.restaurantName,
        restaurantAddress: restaurantAddress ?? this.restaurantAddress,
        restaurantPhone: restaurantPhone ?? this.restaurantPhone,
        restaurantAvatar: restaurantAvatar ?? this.restaurantAvatar,
      );

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        orderDate: DateTime.parse(json["order_date"]),
        deliveryAddress: json["delivery_address"],
        deliveryPhone: json["delivery_phone"],
        deliveryName: json["delivery_name"],
        completeDate: DateTime.parse(json["complete_date"]),
        dishes: List<Dish>.from(json["dishes"].map((x) => Dish.fromJson(x))),
        totalPrice: json["total_price"],
        status: json["status"],
        shipperName: json["shipper_name"],
        shipperPhone: json["shipper_phone"],
        restaurantName: json["restaurant_name"],
        restaurantAddress: json["restaurant_address"],
        restaurantPhone: json["restaurant_phone"],
        restaurantAvatar: json["restaurant_avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_date": orderDate.toIso8601String(),
        "delivery_address": deliveryAddress,
        "delivery_phone": deliveryPhone,
        "delivery_name": deliveryName,
        "complete_date": completeDate.toIso8601String(),
        "dishes": List<dynamic>.from(dishes.map((x) => x.toJson())),
        "total_price": totalPrice,
        "status": status,
        "shipper_name": shipperName,
        "shipper_phone": shipperPhone,
        "restaurant_name": restaurantName,
        "restaurant_address": restaurantAddress,
        "restaurant_phone": restaurantPhone,
        "restaurant_avatar": restaurantAvatar,
      };
}

class Dish {
  final String id;
  final String dishName;
  final double price;
  final int quantity;

  Dish({
    required this.id,
    required this.dishName,
    required this.price,
    required this.quantity,
  });

  Dish copyWith({
    String? id,
    String? dishName,
    double? price,
    int? quantity,
  }) =>
      Dish(
        id: id ?? this.id,
        dishName: dishName ?? this.dishName,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
      );

  factory Dish.fromJson(Map<String, dynamic> json) => Dish(
        id: json["id"],
        dishName: json["dish_name"],
        price: json["price"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dish_name": dishName,
        "price": price,
        "quantity": quantity,
      };
}

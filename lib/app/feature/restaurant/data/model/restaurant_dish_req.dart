import 'package:food_delivery/core/models/common_request_body.dart';

class RestaurantDishReq extends CommonRequsetBody {
  final String? page;
  final String? size;
  final String? restaurantId;
  RestaurantDishReq({
    this.page = "0",
    this.size = "10",
    this.restaurantId,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'size': size,
      'restaurantId': restaurantId,
    };
  }
}

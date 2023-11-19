import 'package:food_delivery/core/models/common_request_body.dart';

class AddDishReq extends CommonRequsetBody {
  final String dishId;
  final int quantity;

  AddDishReq({
    required this.dishId,
    required this.quantity,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      "dishId": dishId,
      "quantity": quantity,
    };
  }
}

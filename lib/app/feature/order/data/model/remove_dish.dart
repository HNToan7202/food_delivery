import 'package:food_delivery/core/models/common_request_body.dart';

class RemoveDishReq extends CommonRequsetBody {
  final String dishId;
  final int quantity;

  RemoveDishReq({required this.dishId, required this.quantity});

  @override
  Map<String, dynamic> toMap() {
    return {
      'dishId': dishId,
      'quantity': quantity,
    };
  }
}

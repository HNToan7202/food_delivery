import 'package:food_delivery/core/models/common_request_body.dart';

class RemoveItemCartReq extends CommonRequsetBody {
  final String dishId;
  final int quantity;

  RemoveItemCartReq(this.dishId, this.quantity);

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dishId': dishId,
      'quantity': quantity,
    };
  }
}

import 'package:food_delivery/core/models/common_request_body.dart';

class DishByCategoryReq extends CommonRequsetBody {
  final String? page;
  final String? size;
  final String? categoryId;

  DishByCategoryReq(
      {this.page = "0", this.size = "10", required this.categoryId});

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'size': size,
      'categoryId': categoryId,
    };
  }
}

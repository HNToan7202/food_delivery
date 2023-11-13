import 'package:food_delivery/core/models/common_request_body.dart';

class CategoriesReq extends CommonRequsetBody {
  final String? page;
  final String? size;
  CategoriesReq({this.page = "1", this.size = "10"});

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'size': size,
    };
  }
}

import '../../../../../core/models/common_request_body.dart';

class RestaurantReq extends CommonRequsetBody {
  final String? page;
  final String? size;
  RestaurantReq({this.page = "0", this.size = "10"});

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'size': size,
    };
  }
}

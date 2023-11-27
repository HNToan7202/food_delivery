import 'package:food_delivery/core/models/common_request_body.dart';

class SearchReq extends CommonRequsetBody {
  final String? index;
  final String? size;
  final String? nameCategory;
  SearchReq({this.index = "0", this.size = "10", this.nameCategory});

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'index': index,
      'size': size,
      'nameCategory': nameCategory,
    };
  }
}

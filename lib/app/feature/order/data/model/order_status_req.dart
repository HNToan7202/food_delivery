// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../../core/models/common_request_body.dart';
import 'order_status.dart';

class OrderStatus extends CommonRequsetBody {
  String page;
  String size;
  String status;
  OrderStatus({
    required this.status,
    required this.page,
    required this.size,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      "page": page,
      "size": size,
      "status": status,
    };
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:food_delivery/core/models/common_request_body.dart';

class ConfirmOrderReq extends CommonRequsetBody {
  final String address;
  final String phone;
  final String fullName;
  ConfirmOrderReq({
    required this.address,
    required this.phone,
    required this.fullName,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'phone': phone,
      'fullName': fullName,
    };
  }
}

import '../../../../../core/models/common_request_body.dart';

class GetUserInfoRequest extends CommonRequsetBody {
  final String? accessToken;

  GetUserInfoRequest({this.accessToken});

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
    };
  }
}

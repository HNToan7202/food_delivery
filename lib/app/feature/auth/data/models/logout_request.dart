import '../../../../../core/models/common_request_body.dart';

class LogoutRequest extends CommonRequsetBody {
  final String accessToken;
  LogoutRequest({
    required this.accessToken,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
    };
  }
}

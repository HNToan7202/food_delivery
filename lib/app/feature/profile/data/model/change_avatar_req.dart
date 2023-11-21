// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import '../../../../../core/models/common_request_body.dart';

class ChangeAvatarReq extends CommonRequsetBody {
  File imageFile;
  ChangeAvatarReq({
    required this.imageFile,
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "imageFile": imageFile,
    };
  }
}

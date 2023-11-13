import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_req.freezed.dart';
part 'base_req.g.dart';

@freezed
class BaseReq with _$BaseReq {
  const factory BaseReq() = _BaseReq;

  factory BaseReq.fromJson(Map<String, dynamic> json) =>
      _$BaseReqFromJson(json);
}

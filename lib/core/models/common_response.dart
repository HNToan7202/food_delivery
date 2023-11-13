// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class CommonResponse<T extends Object> {
  final String status;
  final String message;
  final int code;
  final int time;
  final T? data;
  CommonResponse({
    required this.status,
    required this.message,
    required this.code,
    required this.time,
    this.data,
  });

  @override
  String toString() {
    return 'CommonResponse(status: $status, message: $message, code: $code, time: $time, data: $data)';
  }
}

class ObjectErrorResponse<T extends Object> extends CommonResponse<T> {
  ObjectErrorResponse({
    required super.message,
  }) : super(status: "", code: -1, time: -1);
  factory ObjectErrorResponse.fromMap(Map<String, dynamic> map) {
    return ObjectErrorResponse<T>(message: "Lỗi parse Object");
  }

  @override
  String toString() {
    return 'ObjectErrorResponse(status: $status, message: $message, code: $code, time: $time)';
  }
}

class NetworkErrorResponse<T extends Object> extends CommonResponse<T> {
  NetworkErrorResponse({
    required super.status,
    required super.message,
    required super.code,
    required super.time,
  }) : super();
  factory NetworkErrorResponse.fromMap(Map<String, dynamic> map) {
    return NetworkErrorResponse<T>(
        status: map['status'],
        time: map['time'],
        code: map['code'],
        message: map['message']);
  }

  @override
  String toString() {
    return 'NetworkErrorResponse(status: $status, message: $message, code: $code, time: $time)';
  }
}

class SuccessRessponse<T extends Object> extends CommonResponse<T> {
  SuccessRessponse({
    required super.status,
    required super.message,
    required super.code,
    required super.time,
    required super.data,
  }) : super();

  factory SuccessRessponse.fromMap(Map<String, dynamic> map,
      T? Function(Map<String, dynamic> mapT)? tFromMap) {
    return SuccessRessponse(
        time: map['time'],
        status: map['status'],
        message: map['message'],
        code: map['code'],
        data: map['data'] == null ? null : tFromMap?.call(map['data']));
  }
  @override
  String toString() {
    return 'SuccessRessponse(status: $status, message: $message, code: $code, time: $time, data: $data)';
  }
}

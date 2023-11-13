// // ignore_for_file: public_member_api_docs, sort_constructors_first
// abstract class DataState<T> {
//   final int code;
//   final String status;
//   final int time;
//   final String message;
//   DataState({
//     required this.code,
//     required this.status,
//     required this.time,
//     required this.message,
//   });
// }

// class SuccessData<T> extends DataState<T> {
//   final T data;
//   SuccessData({
//     required this.data,
//   }) : super(code: 0, time: 0, status: "", message: "");
// }

// class FailedData<T> extends DataState<T> {
//   FailedData({
//     required super.code,
//     required super.status,
//     required super.time,
//     required super.message,
//   });
// }

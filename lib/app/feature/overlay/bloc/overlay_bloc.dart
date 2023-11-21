// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:food_delivery/app/feature/order/data/model/order_status.dart';

// import '../../../../common/color_extension.dart';
// import '../../../../common/constants.dart';
// import '../../../../core/models/common_response.dart';
// import '../../../../di.dart';
// import '../../checkout/presentation/page/checkout_page.dart';
// import '../../order/data/model/order_response.dart';
// import '../../order/data/model/order_status_req.dart';
// import '../../order/data/repo/order_repository_impl.dart';

// enum OverlayEvent { show, hide }

// class OverlayBloc extends Bloc<OverlayEvent, OverlayEntry?> {
//   BuildContext context;
//   OverlayBloc(this.context) : super(null) {
//     OverlayState overlayState = Overlay.of(context)!;
//     on<OverlayEvent>((event, emit) async {
//       final res = await locator.get<OrderRepositoryImpl>().getOrderByStatus(
//           OrderStatus(
//               page: "1",
//               size: '10',
//               status: OrderStatusState.UNPURCHASED.name));
//       Order? order;
//       if (res is SuccessRessponse) {
//         order = res.data?.orders.first;
//       }
//       if (event == OverlayEvent.show) {
//         print("show overlay");
//         emit(
//           OverlayEntry(
//             builder: (context) {
//               return Positioned(
//                 bottom: 130,
//                 left: 16,
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   width: MediaQuery.of(context).size.width - 32,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: AppColorScheme.kPrimary,
//                     borderRadius: BorderRadius.circular(32),
//                     boxShadow: [
//                       BoxShadow(
//                           color: AppColorScheme.kPrimary.withOpacity(0.1),
//                           blurRadius: 10,
//                           offset: const Offset(0, 5))
//                     ],
//                   ),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(
//                         context,
//                         CheckoutPage.routeName,
//                       );
//                     },
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "${order?.dishes.length} Món",
//                                   style: const TextStyle(
//                                       color: AppColorScheme.inkWhite),
//                                 ),
//                                 Text("Giao hàng từ ${order?.restaurantName}",
//                                     style: const TextStyle(
//                                         color: AppColorScheme.inkWhite)),
//                               ],
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text(
//                                   MoneyUtils.vndDong(
//                                     order?.totalPrice ?? 0,
//                                   ),
//                                   style: const TextStyle(
//                                       color: AppColorScheme.inkWhite),
//                                 ),
//                                 const Icon(Icons.arrow_forward_ios,
//                                     color: Colors.white)
//                               ],
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       } else if (event == OverlayEvent.hide) {
//         state?.remove();
//         emit(null);
//       }
//     });
//   }
// }

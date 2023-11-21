// import 'package:flutter/material.dart';
// import 'package:food_delivery/app/feature/checkout/presentation/page/checkout_page.dart';
// import 'package:food_delivery/common/constants.dart';

// import '../../../../../common/color_extension.dart';
// import '../../../order/data/model/order_response.dart';

// showOverlay(BuildContext context, Order order) {
//   if (order.dishes.isNotEmpty) {
//     OverlayState overlayState = Overlay.of(context)!;
//     OverlayEntry overlayEntry;

//     overlayEntry = OverlayEntry(builder: (context) {
//       return Positioned(
//         bottom: 130,
//         left: 16,
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//           width: MediaQuery.of(context).size.width - 32,
//           height: 50,
//           decoration: BoxDecoration(
//             color: AppColorScheme.kPrimary,
//             borderRadius: BorderRadius.circular(32),
//             boxShadow: [
//               BoxShadow(
//                   color: AppColorScheme.kPrimary.withOpacity(0.1),
//                   blurRadius: 10,
//                   offset: const Offset(0, 5))
//             ],
//           ),
//           child: GestureDetector(
//             onTap: () {
//               Navigator.pushNamed(
//                 context,
//                 CheckoutPage.routeName,
//               );
//             },
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "${order.dishes.length} Món",
//                           style:
//                               const TextStyle(color: AppColorScheme.inkWhite),
//                         ),
//                         Text("Giao hàng từ ${order.restaurantName}",
//                             style: const TextStyle(
//                                 color: AppColorScheme.inkWhite)),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           MoneyUtils.vndDong(
//                             order.totalPrice,
//                           ),
//                           style: TextStyle(color: AppColorScheme.inkWhite),
//                         ),
//                         const Icon(Icons.arrow_forward_ios, color: Colors.white)
//                       ],
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//     overlayState.insert(overlayEntry);
//   }
// }

// hideOverlay(BuildContext context, OverlayEntry overlayEntry) {
//   OverlayState overlayState = Overlay.of(context)!;
//   overlayEntry.remove();
//   overlayState.dispose();
// }

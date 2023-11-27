// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_delivery/app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:food_delivery/app/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:food_delivery/app/feature/order/data/model/order_request.dart';
import 'package:food_delivery/app/feature/order/presentation/cubit/order_cubit.dart';
import 'package:food_delivery/app/feature/profile/presentation/cubit/user_cubit.dart';
import 'package:food_delivery/common/btn/btn_default.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common/constants.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import '../../../../../common/utils/bottom_sheet_utils.dart';
import '../../../change_address/presentation/page/add_address_page.dart';
import '../../../order/data/model/order_response.dart';
import '../../../payment/presentation/widgets/add_card_view.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    Key? key,
    required this.order,
  }) : super(key: key);

  static const routeName = "/checkout";

  final Order order;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  List paymentArr = [
    {"name": "Cash on delivery", "icon": Assets.images.cash.path},
    {"name": "**** **** **** 2187", "icon": Assets.images.visaIcon.path},
    {"name": "test@gmail.com", "icon": Assets.images.paypal.path},
  ];

  int selectMethod = -1;

  String diaChi = "Thêm địa chỉ nhận hàng";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final user = (state as GetDoneUserState).user;
        return Scaffold(
          backgroundColor: AppColorScheme.white,
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 46,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Image.asset(Assets.images.btnBack.path,
                                    width: 20, height: 20),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Expanded(
                                child: Text(
                                  "Đặt hàng",
                                  style: TextStyle(
                                      color: AppColorScheme.primaryText,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Địa chỉ nhận hàng",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColorScheme.secondaryText,
                                    fontSize: 12),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              BlocBuilder<AuthCubit, AuthState>(
                                builder: (context, state) {
                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              widget.order.deliveryAddress == ""
                                                  ? diaChi
                                                  : widget
                                                      .order.deliveryAddress,
                                              style: TextStyle(
                                                  color: AppColorScheme
                                                      .primaryText,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              update(context: context)
                                                  .then((value) {
                                                if (value != "") {
                                                  setState(() {
                                                    diaChi = value;
                                                  });
                                                }
                                              });
                                            },
                                            child: Text(
                                              "Thay đổi",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color:
                                                      AppColorScheme.kPrimary,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          const Text("Tên Người nhận: "),
                                          Text(user.fullName,
                                              style: TextStyle(
                                                  color:
                                                      AppColorScheme.kPrimary,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700)),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        children: [
                                          const Text("Số điện thoại: "),
                                          Text(user.phone,
                                              style: TextStyle(
                                                  color:
                                                      AppColorScheme.kPrimary,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700)),
                                        ],
                                      )
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration:
                              BoxDecoration(color: AppColorScheme.textfield),
                          height: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Đơn hàng",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 15,
                              ),
                              ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: widget.order.dishes.length,
                                  itemBuilder: ((context, index) {
                                    final dish = widget.order.dishes[index];
                                    return Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.network(dish.image,
                                                  width: 50,
                                                  height: 50,
                                                  fit: BoxFit.cover),
                                              const SizedBox(
                                                width: 32,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(dish.dishName),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(MoneyUtils.vndDong(
                                                      dish.price))
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text("x${dish.quantity}"),
                                              const SizedBox(
                                                width: 16,
                                              ),
                                              const Icon(Icons.edit)
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }))
                            ],
                          ),
                        ),
                        Container(
                          decoration:
                              BoxDecoration(color: AppColorScheme.textfield),
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ghi chú",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColorScheme.secondaryText,
                                    fontSize: 12),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextField(
                                maxLines: 3,
                                decoration: InputDecoration(
                                    hintText: "Thêm ghi chú",
                                    hintStyle: TextStyle(
                                        color: AppColorScheme.secondaryText,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: AppColorScheme.secondaryText
                                                .withOpacity(0.2)))),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Phương thức thanh toán",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColorScheme.secondaryText,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return const AddCardView();
                                            });
                                      },
                                      //icon: Icon(Icons.add, color: AppColorScheme.kPrimary),
                                      child: Text(
                                        "Thêm thẻ mới",
                                        style: TextStyle(
                                            color: AppColorScheme.kPrimary,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: paymentArr.length,
                                itemBuilder: (context, index) {
                                  var pObj = paymentArr[index] as Map? ?? {};
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 15.0),
                                    decoration: BoxDecoration(
                                        color: AppColorScheme.textfield,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: AppColorScheme.secondaryText
                                                .withOpacity(0.2))),
                                    child: Row(
                                      children: [
                                        Image.asset(pObj["icon"].toString(),
                                            width: 50,
                                            height: 20,
                                            fit: BoxFit.contain),
                                        // const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(
                                            pObj["name"],
                                            style: TextStyle(
                                                color:
                                                    AppColorScheme.primaryText,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),

                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              selectMethod = index;
                                            });
                                          },
                                          child: Icon(
                                            selectMethod == index
                                                ? Icons.radio_button_on
                                                : Icons.radio_button_off,
                                            color: AppColorScheme.kPrimary,
                                            size: 15,
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration:
                              BoxDecoration(color: AppColorScheme.textfield),
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tạm tính",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColorScheme.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          MoneyUtils.vndDong(widget.order.totalPrice),
                          style: TextStyle(
                              color: AppColorScheme.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Cost",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColorScheme.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          MoneyUtils.vndDong(20000),
                          style: TextStyle(
                              color: AppColorScheme.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discount",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColorScheme.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          MoneyUtils.vndDong(20000),
                          style: TextStyle(
                              color: AppColorScheme.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: AppColorScheme.secondaryText.withOpacity(0.5),
                      height: 1,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColorScheme.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          MoneyUtils.vndDong(widget.order.totalPrice),
                          style: TextStyle(
                              color: AppColorScheme.primaryText,
                              fontSize: 15,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(color: AppColorScheme.textfield),
                height: 8,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
                child: BtnDefault(
                  onTap: () {
                    if (diaChi != "") {
                      EasyLoading.show(status: 'Đang đặt hàng...');
                      context
                          .read<OrderCubit>()
                          .confirmOrder(ConfirmOrderReq(
                              address: diaChi,
                              phone: user.phone,
                              fullName: user.fullName))
                          .then((value) {
                        if (value == true) {
                          EasyLoading.showSuccess('Đặt hàng thành công!');
                          Navigator.pop(context, true);
                          context.read<CartCubit>().clearCart();
                        }
                      });
                    } else {
                      EasyLoading.showError('Vui lòng chọn địa chỉ nhận hàng');
                    }
                  },
                  title: "Đặt món",
                  decoration: BoxDecoration(
                    color: AppColorScheme.kPrimary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Future<String> update({
  required BuildContext context,
}) async {
  TextEditingController txtName = TextEditingController();
  final nameNumber = await BottomSheetUtils.showMaterial(
    context: context,
    isScrollControlled: false,
    child: const SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: AddAddressPage(),
      ),
    ),
  );
  return nameNumber ?? "";
}

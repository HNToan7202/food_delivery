import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_delivery/app/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:food_delivery/app/feature/order/data/model/order_response.dart';
import 'package:food_delivery/app/feature/order/presentation/cubit/order_cubit.dart';
import 'package:food_delivery/app/feature/restaurant/presentation/cubit/restaurant_cubit.dart';
import 'package:food_delivery/app/feature/restaurant/presentation/widgets/res_info.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common/text_theme.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import '../../../../../common/constants.dart';
import '../../../checkout/presentation/page/checkout_page.dart';
import '../widgets/cart_item.dart';
import '../widgets/recent_item_row.dart';
import '../../data/model/restaurant_model.dart';
import '../cubit/restaurant_state.dart';

class ResDetailBody extends StatefulWidget {
  const ResDetailBody({super.key, required this.res});

  final Restaurant res;

  @override
  State<ResDetailBody> createState() => _ResDetailBodyState();
}

class _ResDetailBodyState extends State<ResDetailBody> {
  int loadCart = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                RestaurantInfo(widget: widget),
                const SizedBox(
                  height: 8,
                  width: double.infinity,
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Text("Menu",
                              style: Theme.of(context).textTheme.headline6),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    MultiBlocListener(
                      listeners: [
                        BlocListener<OrderCubit, OrderState>(
                          listener: (context, orderState) {
                            if (orderState is AddDishToOrderSuccess) {
                              EasyLoading.showToast("Thêm món thành công",
                                  toastPosition:
                                      EasyLoadingToastPosition.bottom,
                                  maskType: EasyLoadingMaskType.clear);
                              context
                                  .read<CartCubit>()
                                  .getCart(widget.res.name);
                            }
                          },
                        ),
                        BlocListener<RestaurantCubit, RestaurantState>(
                          listener: (context, restaurantState) {
                            // Xử lý sự kiện từ RestaurantCubit
                          },
                        ),
                      ],
                      child: BlocBuilder<RestaurantCubit, RestaurantState>(
                        builder: (context, restaurantState) {
                          if (restaurantState is RestaurantDishLoaded) {
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              itemCount: restaurantState.dishes.length,
                              itemBuilder: (context, index) {
                                var dish = restaurantState.dishes[index];
                                return BlocBuilder<CartCubit, CartState>(
                                  builder: (context, state) {
                                    if (state is CartHasData) {
                                      for (int i = 0;
                                          i < state.order!.dishes.length;
                                          i++) {
                                        if (state.order?.dishes[i].id ==
                                            dish.id) {
                                          return RecentItemRow(
                                            dish: dish,
                                            item: state.order?.dishes[i]
                                                    .quantity ??
                                                0,
                                            onTap: () {},
                                          );
                                        }
                                      }
                                      return RecentItemRow(
                                        dish: dish,
                                        onTap: () {},
                                      );
                                    } else {
                                      return RecentItemRow(
                                        dish: dish,
                                        onTap: () {},
                                      );
                                    }
                                  },
                                );
                              },
                            );
                          }
                          if (restaurantState is RestaurantNoData) {
                            return const Center(
                              child: Text("No data"),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartNoData) {
              return const SizedBox();
            }
            if (state is CartHasData) {
              final order = state.order;
              return Container(
                padding: const EdgeInsets.only(
                    bottom: 32, left: 24, right: 24, top: 16),
                width: double.infinity,
                height: 95,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BtnCheckOut(
                      order: order!,
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        )
      ],
    );
  }
}

class BtnCheckOut extends StatefulWidget {
  final Order order;
  const BtnCheckOut({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<BtnCheckOut> createState() => _BtnCheckOutState();
}

class _BtnCheckOutState extends State<BtnCheckOut> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartNoData) {
          return const SizedBox();
        }
        return isLoading == false
            ? Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: ((context) => Container(
                              padding: const EdgeInsets.all(16),
                              height: 300,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Giỏ hàng",
                                        style: tStyle.PrM(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Xoá hết",
                                              style: tStyle.PrM(
                                                  color:
                                                      AppColorScheme.kPrimary)),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          Image.asset(
                                            Assets.images.close.path,
                                            width: 13,
                                            height: 13,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: widget.order.dishes.length,
                                    itemBuilder: ((context, index) {
                                      final dish = widget.order.dishes[index];
                                      return CartItem(dish: dish);
                                    }),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 24, vertical: 12),
                                            decoration: BoxDecoration(
                                                color: AppColorScheme.kPrimary
                                                    .withOpacity(0.1),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(Icons.shopping_cart,
                                                    color:
                                                        AppColorScheme.inkDark,
                                                    size: 22),
                                                const SizedBox(
                                                  width: 6,
                                                ),
                                                Text(
                                                  "${widget.order.dishes.length ?? 0}",
                                                  style: tStyle.PrM(
                                                      color: AppColorScheme
                                                          .inkDark,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8),
                                        child: BtnCheckOut(order: widget.order),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                          color: AppColorScheme.kPrimary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.shopping_cart,
                              color: AppColorScheme.inkDark, size: 22),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            "${widget.order.dishes.length ?? 0}",
                            style: tStyle.PrM(
                                color: AppColorScheme.inkDark,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    onTap: () async {
                      Navigator.pushNamed(
                        context,
                        CheckoutPage.routeName,
                        arguments: widget.order,
                      ).then((value) {
                        if (value == true) {
                          setState(() {
                            isLoading = true;
                          });
                        }
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          decoration: BoxDecoration(
                              color: AppColorScheme.kPrimary,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "Xem đơn hàng - ${MoneyUtils.vndDong(widget.order.totalPrice)}",
                            style:
                                const TextStyle(color: AppColorScheme.inkWhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : const SizedBox();
      },
    );
  }
}

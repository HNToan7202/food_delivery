import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/order/presentation/cubit/order_cubit.dart';
import 'package:food_delivery/common/btn/btn_default.dart';
import 'package:food_delivery/common/constants.dart';
import 'package:food_delivery/common/text_theme.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import '../../../../../common/color_extension.dart';
import '../../../order/data/model/add_dish_req.dart';
import '../../data/model/res_dish_response.dart';

class RecentItemRow extends StatelessWidget {
  final Dish dish;
  final VoidCallback onTap;
  const RecentItemRow({
    super.key,
    required this.dish,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                dish.image,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dish.name,
                    textAlign: TextAlign.center,
                    style: tStyle.PrL(
                        color: AppColorScheme.primaryText,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("${dish.price}đ",
                          textAlign: TextAlign.center,
                          style: tStyle.PrS(
                            color: AppColorScheme.secondaryText,
                          )),
                      Text(
                        " . ",
                        textAlign: TextAlign.center,
                        style: tStyle.PrS(
                          color: AppColorScheme.kPrimary,
                        ),
                      ),
                      Text(
                        dish.categoryName,
                        textAlign: TextAlign.center,
                        style: tStyle.PrS(
                          color: AppColorScheme.secondaryText,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        Assets.images.rate.path,
                        width: 10,
                        height: 10,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text("4",
                          textAlign: TextAlign.center,
                          style: tStyle.PrS(
                            color: AppColorScheme.kPrimary,
                          )),
                      const SizedBox(
                        width: 8,
                      ),
                      Text("(4 Ratings)",
                          textAlign: TextAlign.center,
                          style: tStyle.PrSS(
                            color: AppColorScheme.secondaryText,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                final AddDishReq? addDishReq =
                    await showModalBottomSheet<AddDishReq>(
                        context: context,
                        builder: ((context) {
                          return addDishPage(dish: dish);
                        })).then((value) {
                  if (value != null) {
                    context.read<OrderCubit>().addDishToOrder(value);
                  }
                });
                // if (addDishReq != null) {
                //   print(
                //       "Dish:  ${addDishReq.dishId} Quantity ${addDishReq.quantity}");
                //   context.read<OrderCubit>().addDishToOrder(addDishReq);
                // }
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: AppColorScheme.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: AppColorScheme.kPrimary.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.orange,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class addDishPage extends StatefulWidget {
  const addDishPage({
    Key? key,
    required this.dish,
  }) : super(key: key);

  final Dish dish;

  @override
  State<addDishPage> createState() => _addDishPageState();
}

class _addDishPageState extends State<addDishPage> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        height: 300,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(widget.dish.image, width: 140, height: 140),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    widget.dish.name,
                    textAlign: TextAlign.start,
                    style: tStyle.PrL(
                        color: AppColorScheme.primaryText,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColorScheme.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColorScheme.kPrimary.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text("$quantity"),
                    const SizedBox(
                      width: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColorScheme.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: AppColorScheme.kPrimary.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: const Offset(0, 1),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(MoneyUtils.vndDong(widget.dish.price),
                    style: tStyle.PrL(color: AppColorScheme.kPrimary)),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            BtnDefault(
              title: "Thêm vào giỏ hàng",
              decoration: BoxDecoration(
                color: AppColorScheme.kPrimary,
                borderRadius: BorderRadius.circular(10),
              ),
              onTap: () {
                Navigator.pop(
                    context,
                    AddDishReq(
                      dishId: widget.dish.id,
                      quantity: quantity,
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}

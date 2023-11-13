import 'package:flutter/material.dart';
import 'package:food_delivery/app/feature/checkout/presentation/page/checkout_page.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common/text_theme.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import 'package:intl/intl.dart';

import '../../../offer/presentation/widget/round_button.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List itemArr = [
    {"name": "Beef Burger", "count": "1", "price": 16.0},
    {"name": "Classic Burger", "count": "1", "price": 14.0},
    {"name": "Cheese Chicken Burger", "count": "1", "price": 17.0},
    {"name": "Chicken Legs Basket", "count": "1", "price": 15.0},
    {"name": "French Fires Large", "count": "1", "price": 6.0}
  ];
  void loadData() {
    itemArr = itemArr.map((e) => OrderItem.fromJson(e)).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: (() {
                        Navigator.pop(context);
                      }),
                      icon: Image.asset(
                        Assets.images.btnBack.path,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                        child: Text(
                      "My Order",
                      style: tStyle.H5(fontWeight: FontWeight.w800),
                    ))
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Row(
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        Assets.images.shopLogo.path,
                        width: 80,
                        height: 80,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "King Burgers",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColorScheme.primaryText,
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
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
                            Text(
                              "4.9",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColorScheme.kPrimary, fontSize: 12),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              "(124 Ratings)",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColorScheme.secondaryText,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Burger",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColorScheme.secondaryText,
                                  fontSize: 12),
                            ),
                            Text(
                              " . ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColorScheme.kPrimary, fontSize: 12),
                            ),
                            Text(
                              "Western Food",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: AppColorScheme.secondaryText,
                                  fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              Assets.images.locationPin.path,
                              width: 13,
                              height: 13,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Expanded(
                              child: Text(
                                "No 03, 4th Lane, Newyork",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: AppColorScheme.secondaryText,
                                    fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(color: AppColorScheme.textfield),
                child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemBuilder: ((context, index) {
                      OrderItem orderItem = itemArr[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 25),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                "${orderItem.name} x${orderItem.count}",
                                style: TextStyle(
                                    color: AppColorScheme.primaryText,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              NumberFormat.currency(
                                      locale: 'vi_VN', symbol: '₫')
                                  .format(orderItem.price),
                              style: TextStyle(
                                  color: AppColorScheme.primaryText,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      );
                    }),
                    separatorBuilder: ((context, index) => Divider(
                          indent: 25,
                          endIndent: 25,
                          color: AppColorScheme.secondaryText.withOpacity(0.5),
                          height: 1,
                        )),
                    itemCount: itemArr.length),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery Instructions",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColorScheme.primaryText,
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Thêm ghi chú",
                              style: TextStyle(
                                  color: AppColorScheme.kPrimary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
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
                          "Tạm tính",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColorScheme.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          NumberFormat.currency(locale: 'vi_VN', symbol: '₫')
                              .format(68000),
                          style: TextStyle(
                              color: AppColorScheme.kPrimary,
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
                          "Phí vận chuyển",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColorScheme.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          NumberFormat.currency(locale: 'vi_VN', symbol: '₫')
                              .format(20000),
                          style: TextStyle(
                              color: AppColorScheme.kPrimary,
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
                          "Tổng cộng",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: AppColorScheme.primaryText,
                              fontSize: 13,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          NumberFormat.currency(locale: 'vi_VN', symbol: '₫')
                              .format(88000),
                          style: TextStyle(
                              color: AppColorScheme.kPrimary,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              children: [
                RoundButton(
                    title: "Đặt đơn - 88.000đ",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CheckoutPage(),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderItem {
  String name;
  String count;
  double price;
  OrderItem({required this.name, required this.count, required this.price});

  OrderItem.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        count = json['count'],
        price = json['price'];
}

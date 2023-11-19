import 'package:flutter/material.dart';
import 'package:food_delivery/app/feature/home/domain/entities/menu_item.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common/text_theme.dart';
import 'package:food_delivery/gen/assets.gen.dart';

import '../../../home/presentation/widgets/popular_resutaurant_row.dart';
import '../widget/round_button.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({super.key});

  @override
  State<OfferPage> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  List offerArr = [
    {
      "image": Assets.images.offer1.path,
      "name": "Cà phê Minh Nhật",
      "rate": "4.9",
      "rating": "124",
      "type": "Café",
      "food_type": "Nước Uống"
    },
    {
      "image": Assets.images.offer2.path,
      "name": "Bánh Cuốn Nóng",
      "rate": "4.9",
      "rating": "124",
      "type": "Món cuốn",
      "food_type": "Món truyền thống"
    },
    {
      "image": Assets.images.offer3.path,
      "name": "Cafe Phin",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Nước Uống"
    },
    {
      "image": Assets.images.offer1.path,
      "name": "Capuche",
      "rate": "4.9",
      "rating": "124",
      "type": "Café",
      "food_type": "Nước Uống"
    },
    {
      "image": Assets.images.offer2.path,
      "name": "Bánh Cuốn Nóng",
      "rate": "4.9",
      "rating": "124",
      "type": "Món cuốn",
      "food_type": "Món truyền thống"
    },
    {
      "image": Assets.images.offer1.path,
      "name": "Capuchino",
      "rate": "4.9",
      "rating": "124",
      "type": "Café",
      "food_type": "Nước Uống"
    },
  ];

  void loadData() {
    offerArr = offerArr.map((e) => MenuItems.fromJson(e)).toList();
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Ưu đãi mới nhất",
                      style: TextStyle(
                          color: AppColorScheme.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    IconButton(
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => const MyOrderView()));
                      },
                      icon: Image.asset(
                        Assets.images.shoppingCart.path,
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tìm kiếm những ưu đã đặc biệt\ndành cho bạn!",
                      style: tStyle.PrM(
                        color: AppColorScheme.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: 140,
                  height: 30,
                  child: RoundButton(
                      title: "Xem ngay", fontSize: 12, onPressed: () {}),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // ListView.builder(
              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   padding: EdgeInsets.zero,
              //   itemCount: offerArr.length,
              //   itemBuilder: ((context, index) {
              //     MenuItems items = offerArr[index];
              //     return PopularRestaurantRow(
              //       menuItems: items,
              //       onTap: () {},
              //     );
              //   }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

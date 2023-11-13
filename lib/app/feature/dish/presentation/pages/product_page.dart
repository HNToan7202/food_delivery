import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/dish/presentation/cubit/dish_cubit.dart';
import 'package:food_delivery/app/feature/home/data/model/categories_response.dart';
import 'package:food_delivery/app/feature/home/domain/entities/menu_item.dart';
import 'package:food_delivery/app/feature/dish_detail/presentation/pages/product_detail_page.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/gen/assets.gen.dart';

import '../../../../../common/input/round_textfield.dart';
import '../widgets/menu_item_row.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key, required this.foodCategory});
  final Category foodCategory;

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List menuItemsArr = [
    {
      "image": Assets.images.dess1.path,
      "name": "Bánh Thịt Gà",
      "rate": "4.9",
      "rating": "124",
      "type": "Bánh Mặn",
      "food_type": "Tráng Miệng"
    },
    {
      "image": Assets.images.dess2.path,
      "name": "Bánh Socola",
      "rate": "4.9",
      "rating": "124",
      "type": "Bánh Ngọt",
      "food_type": "Tráng Miệng"
    },
    {
      "image": Assets.images.dess3.path,
      "name": "Cà Phê Sữa",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe Kem",
      "food_type": "Kem"
    },
    {
      "image": Assets.images.dess4.path,
      "name": "Fudgy Chewy Brownies",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Tráng miệng"
    },
    {
      "image": Assets.images.dess1.path,
      "name": "French Apple Pie",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Thức Ăn Nhẹ"
    },
    {
      "image": Assets.images.dess2.path,
      "name": "Dark Chocolate Cake",
      "rate": "4.9",
      "rating": "124",
      "type": "Cakes by Tella",
      "food_type": "Thức ăn nhẹ"
    },
    {
      "image": Assets.images.dess3.path,
      "name": "Street Shake",
      "rate": "4.9",
      "rating": "124",
      "type": "Café Racer",
      "food_type": "Thức Ăn Nhẹ"
    },
    {
      "image": Assets.images.dess4.path,
      "name": "Fudgy Chewy Brownies",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Thức Ăn Nhẹ"
    },
  ];
  void loadData() {
    menuItemsArr = menuItemsArr.map((e) => MenuItems.fromJson(e)).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<DishCubit>()
        .getDishByCateId("725fdbcd-9d08-4f3a-9062-f60c222db545");
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                        widget.foodCategory.name,
                        style: TextStyle(
                            color: AppColorScheme.primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const MyOrderView()));
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundTextfield(
                  hintText: "Tìm kiếm",
                  //controller: txtSearch,
                  left: Container(
                    alignment: Alignment.center,
                    width: 30,
                    child: Image.asset(
                      Assets.images.search.path,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: menuItemsArr.length,
                itemBuilder: ((context, index) {
                  MenuItems mObj = menuItemsArr[index];
                  return MenuItemRow(
                    mObj: mObj,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ProductDetailPage()),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

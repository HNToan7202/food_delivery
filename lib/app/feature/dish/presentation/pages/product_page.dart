import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/dish/presentation/cubit/dish_cubit.dart';
import 'package:food_delivery/app/feature/home/data/model/categories_response.dart';
import 'package:food_delivery/app/feature/dish_detail/presentation/pages/product_detail_page.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../common/input/round_textfield.dart';
import '../../data/model/dish_model.dart';
import '../widgets/menu_item_row.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({
    super.key,
    required this.category,
  });
  final Category category;

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List menuItemsArr = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DishCubit, DishState>(
      listener: (context, state) {
        if (state is DishLoaded) {
          menuItemsArr = state.listDish;
        }
      },
      builder: (context, state) {
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
                            widget.category.name,
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
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: menuItemsArr.length,
                    itemBuilder: ((context, index) {
                      if (state is DishLoading) {
                        return Shimmer.fromColors(
                          baseColor: AppColorScheme.inkGray,
                          highlightColor: AppColorScheme.inkDarkGray,
                          child: MenuItemRow(
                            dish: null,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProductDetailPage()),
                              );
                            },
                          ),
                        );
                      } else {
                        Dish dish = menuItemsArr[index];
                        return MenuItemRow(
                          dish: dish,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ProductDetailPage()),
                            );
                          },
                        );
                      }
                    }),
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 8,
                        color: AppColorScheme.inkLightGray,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

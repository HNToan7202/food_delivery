import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/menu/cubit/menu_cubit.dart';
import 'package:food_delivery/app/feature/restaurant/presentation/page/res_detail_page.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../common/color_extension.dart';
import '../../../../../common/input/round_textfield.dart';
import '../../../../../common/text_theme.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../change_address/presentation/page/change_address_page.dart';
import '../../../offer/presentation/widget/popular_resutaurant_row.dart';
import '../../../restaurant/data/model/restaurant_model.dart';
import '../../data/model/categories_response.dart';
import '../widgets/category_cell.dart';
import '../widgets/most_popular_cell.dart';
import '../widgets/view_all_title_row.dart';
import 'cubit/home_cubit.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  TextEditingController txtSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.bg,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
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
                      "Chào Nguyễn Hoàng Toàn",
                      style: TextStyle(
                          color: AppColorScheme.primaryText,
                          fontSize: 18,
                          fontWeight: FontWeight.w800),
                    ),
                    IconButton(
                      onPressed: (() {}),
                      icon: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset(
                          Assets.images.logo.path,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vận chuyển đến",
                      style: tStyle.PrS(color: AppColorScheme.secondaryText),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "55/10/20 Đường 160, Q9, TP.Thủ Đức",
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: tStyle.PrL(
                            color: AppColorScheme.primaryText,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ChangeAddressPage()),
                            );
                          },
                          child: Image.asset(
                            Assets.images.dropdown.path,
                            width: 12,
                            height: 12,
                          ),
                        ),
                      ],
                    )
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
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    Assets.images.introHome.path,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "Danh mục",
                  onView: () {},
                ),
              ),
              BlocBuilder<MenuCubit, MenuState>(
                builder: (context, state) {
                  if (state is MenuLoadingState) {
                    return Shimmer.fromColors(
                      baseColor: AppColorScheme.inkGray,
                      highlightColor: AppColorScheme.inkDarkGray,
                      child: SizedBox(
                        height: 140,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          itemCount: 3,
                          itemBuilder: ((context, index) {
                            return const ItemCate(
                              cObj: null,
                            );
                          }),
                        ),
                      ),
                    );
                  } else if (state is MenuLoadedState) {
                    final categories = (state).categories?.categories ?? [];
                    return SizedBox(
                      height: 140,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        itemCount: categories.length,
                        itemBuilder: ((context, index) {
                          Category cObj = categories[index];
                          return CategoryCell(cObj: cObj, onTap: (() {}));
                        }),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "Thương hiệu nổi bật",
                  onView: () {},
                ),
              ),
              SizedBox(
                height: 200,
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (_, state) {
                    if (state is LoadingRestaurant) {
                      return Shimmer.fromColors(
                        baseColor: AppColorScheme.inkGray,
                        highlightColor: AppColorScheme.inkDarkGray,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          itemCount: 3,
                          itemBuilder: ((context, index) {
                            return MostPopularCell(
                              mObj: null,
                              onTap: () {},
                            );
                          }),
                        ),
                      );
                    } else if (state is HomeGetAllRest) {
                      final listRes = (state).listRest;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        itemCount: listRes.length,
                        itemBuilder: ((context, index) {
                          Restaurant mObj = listRes[index];
                          // var mObj = mostPopArr[index] as Map? ?? {};
                          return MostPopularCell(
                            mObj: mObj,
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                RestaurantDetailPage.routeName,
                                arguments: mObj,
                              );
                            },
                          );
                        }),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "Best seller",
                  onView: () {},
                ),
              ),
              // ListView.builder(
              //   physics: const NeverScrollableScrollPhysics(),
              //   shrinkWrap: true,
              //   padding: const EdgeInsets.symmetric(horizontal: 15),
              //   itemCount: recentArr.length,
              //   itemBuilder: ((context, index) {
              //     var rObj = recentArr[index] as Map? ?? {};
              //     return RecentItemRow(
              //       rObj: rObj,
              //       onTap: () {},
              //     );
              //   }),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemRestaurant extends StatelessWidget {
  const ItemRestaurant({
    Key? key,
    required this.listRes,
  }) : super(key: key);

  final List<Restaurant> listRes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: listRes.length,
      itemBuilder: ((context, index) {
        Restaurant items = listRes[index];
        return PopularRestaurantRow(
          onTap: () {
            Navigator.of(context).pushNamed(
              RestaurantDetailPage.routeName,
              arguments: items,
            );
          },
          restaurant: items,
        );
      }),
    );
  }
}

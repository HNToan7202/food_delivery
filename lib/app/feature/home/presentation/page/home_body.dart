import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/restaurant/presentation/page/res_detail_page.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../common/color_extension.dart';
import '../../../../../common/input/round_textfield.dart';
import '../../../../../common/text_theme.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../change_address/presentation/page/change_address_page.dart';
import '../../../offer/presentation/widget/popular_resutaurant_row.dart';
import '../../../restaurant/data/model/restaurant_model.dart';
import '../../domain/entities/menu_item.dart';
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

  List catArr = [
    {"image": Assets.images.catOffer.path, "name": "Đồ Ăn Nhanh"},
    {"image": Assets.images.catSri.path, "name": "Cháo/Soup"},
    {"image": Assets.images.cat3.path, "name": "Tráng Miệng"},
    {"image": Assets.images.cat4.path, "name": "Bún/Phở/Mì"},
  ];

  List popArr = [
    {
      "image": Assets.images.res1.path,
      "name": "Súp Cua Mộc",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Đồ Ăn Nhanh"
    },
    {
      "image": Assets.images.res2.path,
      "name": "Trang Anh Food",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
    {
      "image": Assets.images.res3.path,
      "name": "Bán Mì Khánh Mập",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
  ];

  List mostPopArr = [
    {
      "image": Assets.images.mRes1.path,
      "name": "Kin Piza",
      "rate": "4.9",
      "rating": "124",
      "type": "Món quốc tế",
      "food_type": "Thức Ăn Nhanh"
    },
    {
      "image": Assets.images.mRes2.path,
      "name": "Bánh mì kẹp",
      "rate": "4.9",
      "rating": "124",
      "type": "Bánh mì ngon",
      "food_type": "Ăn vặt"
    },
  ];

  List recentArr = [
    {
      "image": Assets.images.item1.path,
      "name": "Pizza Kido",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
    {
      "image": Assets.images.item2.path,
      "name": "Highlands Coffe",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
    {
      "image": Assets.images.item3.path,
      "name": "Cơm kiến quốc",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
  ];

  void loadData() {
    popArr = popArr.map((e) => MenuItems.fromJson(e)).toList();
  }

  @override
  void initState() {
    super.initState();
    loadData();
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
                      "Xin chào Toan!",
                      style: TextStyle(
                          color: AppColorScheme.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    IconButton(
                      onPressed: (() {}),
                      icon: Image.asset(
                        Assets.images.shoppingCart.path,
                        width: 25,
                        height: 25,
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
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: catArr.length,
                  itemBuilder: ((context, index) {
                    var cObj = catArr[index] as Map? ?? {};
                    return CategoryCell(cObj: cObj, onTap: (() {}));
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "Thương hiệu nổi bật",
                  onView: () {},
                ),
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (_, state) {
                  if (state is LoadingRestaurant) {
                    return Shimmer.fromColors(
                      baseColor: AppColorScheme.inkGray,
                      highlightColor: AppColorScheme.inkDarkGray,
                      child: const ItemRestaurant(
                        listRes: [],
                      ),
                    );
                  } else {
                    final listRes = (state as HomeGetAllRest).listRest;
                    return ItemRestaurant(
                      listRes: listRes,
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "Phổ biến nhất",
                  onView: () {},
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: mostPopArr.length,
                  itemBuilder: ((context, index) {
                    var mObj = mostPopArr[index] as Map? ?? {};
                    return MostPopularCell(
                      mObj: mObj,
                      onTap: () {},
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "Gợi ý để bạn chọn",
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

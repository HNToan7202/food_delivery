import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/dish/presentation/cubit/dish_cubit.dart';
import 'package:food_delivery/app/feature/home/data/model/categories_response.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../common/color_extension.dart';
import '../../../../../../common/input/round_textfield.dart';
import '../../../../../../common/text_theme.dart';
import '../../../../../../gen/assets.gen.dart';
import '../dish/presentation/pages/product_page.dart';
import '../home/domain/entities/food_category.dart';
import 'cubit/menu_cubit.dart';

class MenuBody extends StatefulWidget {
  const MenuBody({super.key});

  @override
  State<MenuBody> createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  List<FoodCategory> menuItems = [];

  bool isLoading = false;

  void loadData() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLoading = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return BlocConsumer<MenuCubit, MenuState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is MenuLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final categories =
              (state as MenuLoadedState).categories?.categories ?? [];
          return Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 190),
                width: media.width * 0.25,
                height: media.height * 0.6,
                decoration: BoxDecoration(
                  color: AppColorScheme.kPrimary,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(35),
                      bottomRight: Radius.circular(35)),
                ),
              ),
              SingleChildScrollView(
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
                              "Menu",
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
                      SizedBox(
                        height: 500,
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 30),
                            itemCount: categories.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: ((context, index) {
                              Category mObj = categories[index];
                              return (isLoading == false
                                  ? Shimmer.fromColors(
                                      baseColor: AppColorScheme.inkGray,
                                      highlightColor:
                                          AppColorScheme.inkDarkGray,
                                      enabled: true,
                                      child: ListMenu(mObj: mObj, media: media),
                                    )
                                  : ListMenu(mObj: mObj, media: media));
                            })),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}

class ListMenu extends StatelessWidget {
  const ListMenu({
    Key? key,
    required this.mObj,
    required this.media,
  }) : super(key: key);

  final Category mObj;
  final Size media;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => DishCubit()..getDishByCateId(mObj.id),
              child: CategoriesPage(
                category: mObj,
              ),
            ),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 8, right: 20),
            width: media.width - 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppColorScheme.inkWhite,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 7,
                  offset: Offset(0, 4),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Image.network(
                  mObj.image,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mObj.name,
                      style: tStyle.H5(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${mObj.itemCount} items",
                      style: tStyle.PrSS(
                        color: AppColorScheme.secondaryText,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColorScheme.inkWhite,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Image.asset(
                    Assets.images.btnNext.path,
                    width: 15,
                    height: 15,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

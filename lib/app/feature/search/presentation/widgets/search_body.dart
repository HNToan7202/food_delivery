import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/common/input/input_default.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../common/color_extension.dart';
import '../cubit/search_cubit.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          "Tìm kiếm",
          style: TextStyle(
              color: AppColorScheme.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w800),
        ),
        elevation: 0,
        backgroundColor: AppColorScheme.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  InputDefault(
                    onFieldSubmitted: (p0) {
                      context.read<SearchCubit>().search(p0);
                    },
                    decoration: InputDecoration(
                      hintText: "Tìm kiếm",
                      hintStyle: const TextStyle(
                          color: AppColorScheme.inkGray,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      suffixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColorScheme.inkLightGray,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColorScheme.inkLightGray,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColorScheme.inkLightGray,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return Image.asset(Assets.images.shimmerSeach.path);
                } else if (state is SearchLoaded) {
                  final res = (state).restaurants;
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: res.length,
                    itemBuilder: ((context, index) {
                      var item = res[index];
                      return Container(
                          padding: const EdgeInsets.all(16),
                          height: 140,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  item.logo ?? "",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item.name ?? "",
                                      style: TextStyle(
                                          color: AppColorScheme.primaryText,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      item.address ?? "",
                                      style: const TextStyle(
                                          color: AppColorScheme.inkGray,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ));
                    }),
                    separatorBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 8,
                        color: AppColorScheme.inkDarkGray.withOpacity(0.6),
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingSearch extends StatelessWidget {
  const LoadingSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColorScheme.inkLightGray.withOpacity(0.6),
      highlightColor: AppColorScheme.inkDarkGray.withOpacity(0.2),
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: 3,
        itemBuilder: ((context, index) {
          return Container(
            height: 100,
            color: Colors.blue,
            child: const Text("Loading..."),
          );
        }),
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 8,
            color: AppColorScheme.inkDarkGray.withOpacity(0.6),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/common/input/input_default.dart';
import 'package:food_delivery/common/text_theme.dart';

import '../../../../../common/input/round_textfield.dart';
import '../../../../../gen/assets.gen.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            RoundTextfield(
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
            Categories()
          ],
        ),
      )),
    );
  }
}

List<String> recents = [
  "Biryani",
  "Dosa",
  "Veg Pakoda",
  "Chicken Tikka",
  "Tandoori",
  "Falooda",
];

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("CATEGORIES",
                style: tStyle.PrM(
                  color: AppColorScheme.kPrimary,
                  fontWeight: FontWeight.bold,
                )),
            TextButton(
              onPressed: () {},
              child: Text(
                "view all",
                style: tStyle.PrM(
                  color: AppColorScheme.kPrimary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: media.width,
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(
              buttons.length,
              (index) {
                return MaterialButton(
                  onPressed: () {},
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      40,
                    ),
                  ),
                  color: AppColorScheme.inkDark.withOpacity(0.1),
                  child: Text(
                    buttons[index],
                    style: tStyle.PrM(
                      color: AppColorScheme.inkDark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

List<String> buttons = [
  "Breakfast",
  "Fastfood",
  "Lunch",
  "South Indian",
  "North Indian",
  "Dinner",
  "Pure Veg",
  "Non Veg",
];

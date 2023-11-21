import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/common/text_theme.dart';

import '../../../../../common/color_extension.dart';
import '../../../dish/presentation/cubit/dish_cubit.dart';
import '../../../dish/presentation/pages/product_page.dart';
import '../../data/model/categories_response.dart';

class CategoryCell extends StatelessWidget {
  final Category cObj;
  final VoidCallback onTap;
  const CategoryCell({super.key, required this.cObj, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: (() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (context) => DishCubit()..getDishByCateId(cObj.id),
                child: CategoriesPage(
                  category: cObj,
                ),
              ),
            ),
          );
        }),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                cObj.image,
                width: 85,
                height: 85,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              cObj.name,
              textAlign: TextAlign.center,
              style: tStyle.PrM(
                  color: AppColorScheme.primaryText,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/home/data/model/categories_req.dart';
import 'package:food_delivery/app/feature/home/presentation/page/cubit/cubit/menu_cubit.dart';
import 'package:food_delivery/app/feature/home/presentation/page/menu/menu_body.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MenuBody();
  }
}

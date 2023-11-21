// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/order/presentation/cubit/order_cubit.dart';
import 'package:food_delivery/app/feature/order/presentation/pages/user_order_tab_body.dart';

class UserOrderTab extends StatelessWidget {
  const UserOrderTab({
    Key? key,
    required this.status,
  }) : super(key: key);
  final String status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(),
      child: Scaffold(
        body: UserOrderTabBody(status: status),
      ),
    );
  }
}

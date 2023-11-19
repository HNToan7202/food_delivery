import 'package:flutter/material.dart';
import 'package:food_delivery/common/color_extension.dart';

class OrdersAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OrdersAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColorScheme.inkWhite,
      title: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text(
          'Orders',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
      elevation: 0,
      leadingWidth: 50,
      bottom: TabBar(
        tabs: const [
          Tab(text: 'UnPurchased'),
          Tab(text: 'Pending'),
          Tab(text: 'Confirmed'),
          Tab(text: 'Shipping'),
          Tab(text: 'Delivered'),
          Tab(text: 'Finished'),
          Tab(text: 'Cancelled'),
        ],
        labelColor: AppColorScheme.kPrimary,
        unselectedLabelColor: AppColorScheme.kPrimary,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        indicator: UnderlineTabIndicator(
          // borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(color: AppColorScheme.kPrimary, width: 2.5),
        ),
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(108);
}

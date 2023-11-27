import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/cart/presentation/page/cart_page.dart';
import 'package:food_delivery/app/feature/home/presentation/page/home_page.dart';
import 'package:food_delivery/app/feature/more/persentation/pages/more_page.dart';
import 'package:food_delivery/app/feature/notification/presentation/pages/notification_page.dart';
import 'package:food_delivery/app/feature/order/presentation/pages/order_page.dart';
import 'package:food_delivery/app/feature/search/presentation/page/search_page.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import '../../../../../common/btn/tab_button.dart';
import 'package:badges/badges.dart' as badges;

import '../../../order/presentation/cubit/order_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  static const routeName = "/navBar";

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with WidgetsBindingObserver {
  int tab = 2;
  PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget selectPageView = const HomePage();

  int item = 1;

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<OverlayBloc>(context).add(OverlayEvent.show);
    // WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<OrderCubit, OrderState>(
          listener: (context, state) {
            if (state is OrderLoaded) {
              final orders = state.orders;
              if (orders.isNotEmpty) {
                item = orders.length;
              } else {
                item = 0;
              }
            }
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xFff5f5f5),
        body: PageStorage(
          bucket: pageStorageBucket,
          child: selectPageView,
        ),
        floatingActionButton: tab == 2
            ? BlocBuilder<OrderCubit, OrderState>(
                builder: (context, state) {
                  return state is OrderLoaded
                      ? Badge(
                          position: BadgePosition.topEnd(top: -13, end: -11),
                          badgeContent: Text(
                            "${state.orders.length.toString()}}",
                            style:
                                const TextStyle(color: AppColorScheme.inkWhite),
                          ),
                          badgeStyle: badges.BadgeStyle(
                            badgeColor: AppColorScheme.kPrimary,
                            elevation: 0,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, CartPage.routeName);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColorScheme.inkWhite,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.all(10),
                              width: 40,
                              height: 40,
                              child: Assets.images.shoppingCart.image(
                                width: 25,
                                height: 25,
                                color: AppColorScheme.kPrimary,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox();
                },
              )
            : const SizedBox(),
        bottomNavigationBar: BottomAppBar(
          color: AppColorScheme.white,
          elevation: 1,
          notchMargin: 12,
          shape: const CircularNotchedRectangle(),
          child: SafeArea(
            child: SizedBox(
              height: 64,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TabButton(
                      title: AppLocalizations.of(context)!.homeTab,
                      icon: Assets.images.tabMenu.path,
                      onTap: () {
                        if (tab != 2) {
                          tab = 2;
                          selectPageView = const HomePage();
                        }
                        if (mounted) {
                          setState(() {});
                        }
                      },
                      isSelected: tab == 2),
                  TabButton(
                      title: AppLocalizations.of(context)!.searchTab,
                      icon: Assets.images.search.path,
                      onTap: () {
                        if (tab != 0) {
                          tab = 0;
                          selectPageView = const SearchPage();
                        }
                        if (mounted) {
                          setState(() {});
                        }
                      },
                      isSelected: tab == 0),
                  TabButton(
                      title: AppLocalizations.of(context)!.orderTab,
                      icon: Assets.images.tabOffer.path,
                      onTap: () {
                        if (tab != 1) {
                          tab = 1;
                          selectPageView = const OrderPage();
                        }
                        if (mounted) {
                          setState(() {});
                        }
                      },
                      isSelected: tab == 1),
                  TabButton(
                      title: AppLocalizations.of(context)!.notificationTab,
                      icon: Assets.images.moreNotification.path,
                      onTap: () {
                        if (tab != 3) {
                          tab = 3;
                          selectPageView = const NotificationPage();
                        }
                        if (mounted) {
                          setState(() {});
                        }
                      },
                      isSelected: tab == 3),
                  TabButton(
                      title: AppLocalizations.of(context)!.moreTab,
                      icon: Assets.images.tabMore.path,
                      onTap: () {
                        if (tab != 4) {
                          tab = 4;
                          selectPageView = const MorePage();
                        }
                        if (mounted) {
                          setState(() {});
                        }
                      },
                      isSelected: tab == 4),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery/app/feature/home/presentation/page/home_page.dart';
import 'package:food_delivery/app/feature/more/persentation/pages/more_page.dart';
import 'package:food_delivery/app/feature/notification/presentation/pages/notification_page.dart';
import 'package:food_delivery/app/feature/offer/presentation/page/offer_page.dart';
import 'package:food_delivery/app/feature/order/presentation/pages/order_page.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import '../../../../../common/btn/tab_button.dart';
import '../../../menu/menu_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  static const routeName = "/navBar";

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int tab = 2;
  PageStorageBucket pageStorageBucket = PageStorageBucket();
  Widget selectPageView = const HomePage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFff5f5f5),
      body: PageStorage(
        bucket: pageStorageBucket,
        child: selectPageView,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor:
              tab == 2 ? AppColorScheme.kPrimary : AppColorScheme.placeholder,
          onPressed: () {
            if (tab != 2) {
              tab = 2;
              selectPageView = const HomePage();
            }
            if (mounted) {
              setState(() {});
            }
          },
          child: Assets.images.tabHome.image(
            width: 30,
            height: 30,
          ),
        ),
      ),
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
                    title: "Menu",
                    icon: Assets.images.tabMenu.path,
                    onTap: () {
                      if (tab != 0) {
                        tab = 0;
                        selectPageView = const MenuPage();
                      }
                      if (mounted) {
                        setState(() {});
                      }
                    },
                    isSelected: tab == 0),
                TabButton(
                    title: "Order",
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
                const SizedBox(
                  width: 40,
                  height: 40,
                ),
                TabButton(
                    title: "Notify",
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
                    title: "More",
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
    );
  }
}

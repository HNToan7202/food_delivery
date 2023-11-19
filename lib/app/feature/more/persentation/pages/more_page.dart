import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:food_delivery/app/feature/change_address/presentation/page/address_page.dart';
import 'package:food_delivery/app/feature/multiple_language/presentation/pages/multiple_language_page.dart';
import 'package:food_delivery/app/feature/notification/presentation/pages/notification_page.dart';
import 'package:food_delivery/app/feature/order/presentation/pages/order_page.dart';
import 'package:food_delivery/app/feature/payment/presentation/pages/payment_page.dart';
import 'package:food_delivery/app/feature/profile/presentation/pages/profile_page.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../domain/entities/item_more_entities.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  List<ItemsMore> loadData(BuildContext context) {
    List moreArr = [
      {
        "index": "0",
        "name": AppLocalizations.of(context)!.changeLanguage,
        "image": Assets.images.world.path,
        "base": 0
      },
      {
        "index": "1",
        "name": AppLocalizations.of(context)!.paymentDetails,
        "image": Assets.images.morePayment.path,
        "base": 0
      },
      {
        "index": "2",
        "name": AppLocalizations.of(context)!.myOrder,
        "image": Assets.images.moreMyOrder.path,
        "base": 1
      },
      {
        "index": "3",
        "name": AppLocalizations.of(context)!.notifications,
        "image": Assets.images.moreNotification.path,
        "base": 15
      },
      {
        "index": "4",
        "name": AppLocalizations.of(context)!.inbox,
        "image": Assets.images.moreInbox.path,
        "base": 1000
      },
      {
        "index": "5",
        "name": "Sổ địa chỉ",
        "image": Assets.images.mapPin.path,
        "base": 0
      },
    ];
    return moreArr = moreArr.map((e) => ItemsMore.fromJson(e)).toList();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                      "More",
                      style: TextStyle(
                          color: AppColorScheme.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        Assets.images.shoppingCart.path,
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfilePage()));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 20),
                      child: Stack(
                        alignment: Alignment.centerRight,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        state is GetDoneUserState
                                            ? state.user.avatar
                                            : "")),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state is GetDoneUserState
                                            ? state.user.fullName
                                            : "",
                                        style: TextStyle(
                                            color: AppColorScheme.primaryText,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          state is GetDoneUserState
                                              ? state.user.isActive == true
                                                  ? "Đã xác thực"
                                                  : "Chưa xác thực"
                                              : "",
                                          style: TextStyle(
                                              color: state is GetDoneUserState
                                                  ? state.user?.isActive ??
                                                          false
                                                      ? AppColorScheme
                                                          .light.success
                                                      : AppColorScheme
                                                          .light.warning
                                                  : AppColorScheme.kPrimary,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600))
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: AppColorScheme.inkWhite,
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: Image.asset(Assets.images.btnNext.path,
                                      width: 10,
                                      height: 10,
                                      color: AppColorScheme.kPrimary),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: loadData(context).length,
                itemBuilder: ((context, index) {
                  List<ItemsMore> moreArr = loadData(context);
                  ItemsMore itemsMore = moreArr[index];
                  var countBase = itemsMore.base;
                  return GestureDetector(
                      onTap: () {
                        switch (itemsMore.index) {
                          case "-1":
                            Navigator.of(context)
                                .pushNamed(ProfilePage.routeName);
                            break;
                          case "0":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MultiplePage()));
                            break;
                          case "1":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const PaymentPage()));
                            break;
                          case "2":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const OrderPage()));
                            break;
                          case "3":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const NotificationPage()));
                            break;
                          case "5":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddressPage()));
                            break;

                          default:
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 6, horizontal: 20),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: AppColorScheme.kPrimary,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    alignment: Alignment.center,
                                    child: Image.asset(itemsMore.image,
                                        color: AppColorScheme.inkWhite,
                                        width: 25,
                                        height: 25,
                                        fit: BoxFit.contain),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Text(
                                      itemsMore.name,
                                      style: TextStyle(
                                          color: AppColorScheme.primaryText,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  if (countBase > 0)
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(12.5)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        countBase > 99
                                            ? "99"
                                            : countBase.toString(),
                                        style: TextStyle(
                                            color: AppColorScheme.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: AppColorScheme.inkWhite,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: Image.asset(
                                        Assets.images.btnNext.path,
                                        width: 10,
                                        height: 10,
                                        color: AppColorScheme.kPrimary),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ));
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

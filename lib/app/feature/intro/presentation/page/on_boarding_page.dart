import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/feature/home/presentation/page/nav_bar.dart';
import 'package:food_delivery/app/feature/welcome/presentation/page/welcome_page.dart';
import 'package:food_delivery/common/text_theme.dart';
import 'package:food_delivery/gen/assets.gen.dart';
import '../../../../../common/btn/btn_default.dart';
import '../../../../../common/color_extension.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});
  static const routeName = "/onBoarding";

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int selectPage = 0;
  PageController controller = PageController();

  List pageArr = [
    {
      "title": "Find Food You Love",
      "subtitle":
          "Discover the best foods from over 1,000\nrestaurants and fast delivery to your\ndoorstep",
      "image": Assets.images.onBoarding1.path,
    },
    {
      "title": "Fast Delivery",
      "subtitle": "Fast food delivery to your home, office\n wherever you are",
      "image": Assets.images.onBoarding2.path,
    },
    {
      "title": "Live Tracking",
      "subtitle":
          "Real time tracking of your food on the app\nonce you placed the order",
      "image": Assets.images.onBoarding3.path,
    },
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        selectPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    List pageArr = [
      {
        "title": AppLocalizations.of(context)!.findFoodYouLove,
        "subtitle":
            "Discover the best foods from over 1,000\nrestaurants and fast delivery to your\ndoorstep",
        "image": Assets.images.onBoarding1.path,
      },
      {
        "title": AppLocalizations.of(context)!.fastDelivery,
        "subtitle":
            "Fast food delivery to your home, office\n wherever you are",
        "image": Assets.images.onBoarding2.path,
      },
      {
        "title": AppLocalizations.of(context)!.liveTracking,
        "subtitle":
            "Real time tracking of your food on the app\nonce you placed the order",
        "image": Assets.images.onBoarding3.path,
      },
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pageArr.length,
            itemBuilder: ((context, index) {
              var pObj = pageArr[index] as Map? ?? {};
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: media.width,
                    height: media.width,
                    alignment: Alignment.center,
                    child: Image.asset(
                      pObj["image"].toString(),
                      width: media.width * 0.65,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.2,
                  ),
                  Text(
                    pObj["title"].toString(),
                    style: tStyle.T3(
                      color: AppColorScheme.primaryText,
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Text(
                    pObj["subtitle"].toString(),
                    textAlign: TextAlign.center,
                    style: tStyle.PrM(color: AppColorScheme.secondaryText),
                  ),
                  SizedBox(
                    height: media.width * 0.20,
                  ),
                ],
              );
            }),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: media.height * 0.6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: pageArr.map((e) {
                  var index = pageArr.indexOf(e);

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                        color: index == selectPage
                            ? AppColorScheme.kPrimary
                            : AppColorScheme.placeholder,
                        borderRadius: BorderRadius.circular(4)),
                  );
                }).toList(),
              ),
              SizedBox(
                height: media.height * 0.28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: BtnDefault(
                    decoration: BoxDecoration(
                      color: AppColorScheme.kPrimary,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    title: "Next",
                    onTap: () {
                      if (selectPage >= 2) {
                        // Home Screen
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const WelComePage(),
                        //   ),
                        // );

                        Navigator.of(context).pushNamedAndRemoveUntil(
                            WelComePage.routeName, (route) => false,
                            arguments: "");
                      } else {
                        //Next Screen
                        setState(() {
                          selectPage = selectPage + 1;
                          controller.animateToPage(selectPage,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.bounceInOut);
                        });
                      }
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }
}

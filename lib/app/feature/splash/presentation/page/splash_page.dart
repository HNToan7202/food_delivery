import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/app/feature/intro/presentation/page/intro_page.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../intro/presentation/page/on_boarding_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const routeName = "/splash";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    goWelcomePage();
  }

  void goWelcomePage() async {
    await Future.delayed(const Duration(seconds: 3));
    welcomePage();
  }

  void welcomePage() {
    Navigator.of(context).pushNamedAndRemoveUntil(
        IntroPage.routeName, (route) => false,
        arguments: "");
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => const OnBoardingPage()));
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            Assets.images.splashBg.path,
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          Image.asset(
            Assets.images.logoFood.path,
            width: media.width * 0.55,
            height: media.width * 0.55,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

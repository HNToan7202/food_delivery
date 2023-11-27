import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:food_delivery/app/feature/intro/presentation/page/on_boarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../login/presentation/page/login_page.dart';

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
    goWelcomePage();
  }

  void goWelcomePage() async {
    welcomePage();
  }

  void welcomePage() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      getIsFirstTime().then((value) {
        if (value) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              OnBoardingPage.routeName, (route) => false,
              arguments: "");
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
              LoginPage.routeName, (route) => false,
              arguments: "");
        }
      });
    });
  }

  Future<bool> getIsFirstTime() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    return isFirstTime;
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

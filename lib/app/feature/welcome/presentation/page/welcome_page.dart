import 'package:flutter/material.dart';
import 'package:food_delivery/app/feature/login/presentation/page/login_page.dart';
import 'package:food_delivery/app/feature/sign_up/presentation/pages/sign_up_page.dart';
import 'package:food_delivery/common/btn/btn_default.dart';
import 'package:food_delivery/common/color_extension.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:food_delivery/gen/assets.gen.dart';

class WelComePage extends StatelessWidget {
  const WelComePage({super.key});

  static const routeName = "/welcome";

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  Assets.images.welcomeTopShape.path,
                  width: media.width,
                ),
                Image.asset(
                  Assets.images.logoFood.path,
                  width: media.width * 0.45,
                  height: media.width * 0.63,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            SizedBox(
              height: media.width * 0.1,
            ),
            Text(
              AppLocalizations.of(context)!.welcome,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColorScheme.secondaryText,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: media.width * 0.1,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: BtnDefault(
                  title: AppLocalizations.of(context)!.login,
                  decoration: BoxDecoration(
                    color: AppColorScheme.kPrimary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      LoginPage.routeName,
                      (route) => false,
                    );

                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const LoginPage(),
                    //   ),
                    // );
                  },
                )),
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: BtnDefault(
                  title: AppLocalizations.of(context)!.createAccount,
                  level: BtnDefaultLevel.secondary,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      width: 2,
                      color: AppColorScheme.kPrimary,
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      SignUpPage.routeName,
                      (route) => false,
                    );
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const SignUpPage(),
                    //   ),
                    // );
                  },
                )),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

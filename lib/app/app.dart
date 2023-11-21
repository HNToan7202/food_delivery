import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_delivery/app/app_route/app_route.dart';
import 'package:food_delivery/app/feature/multiple_language/presentation/cubit/multiple_language_cubit.dart';
import 'package:overlay_support/overlay_support.dart';
import 'feature/splash/presentation/page/splash_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MultipleLanguageCubit, MultipleLanguageState>(
      builder: (context, state) {
        return OverlaySupport.global(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            locale: state.locale, //
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // home: const SplashPage(),
            initialRoute: SplashPage.routeName,
            onGenerateRoute: onGenerateRoute,
            builder: EasyLoading.init(),
          ),
        );
      },
    );
  }
}

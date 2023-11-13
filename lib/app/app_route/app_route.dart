import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/home/data/model/categories_req.dart';
import 'package:food_delivery/app/feature/home/presentation/page/cubit/cubit/menu_cubit.dart';
import 'package:food_delivery/app/feature/intro/presentation/page/intro_page.dart';
import 'package:food_delivery/app/feature/intro/presentation/page/on_boarding_page.dart';
import 'package:food_delivery/app/feature/login/presentation/bloc/login_bloc.dart';
import 'package:food_delivery/app/feature/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:food_delivery/app/feature/splash/presentation/page/splash_page.dart';
import '../feature/home/presentation/page/nav_bar.dart';
import '../feature/login/presentation/page/login_page.dart';
import '../feature/reset_password/presentation/page/reset_password_page.dart';
import '../feature/sign_up/presentation/pages/sign_up_page.dart';
import '../feature/welcome/presentation/page/welcome_page.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (settings) {
  switch (settings.name) {
    case LoginPage.routeName:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => LoginBloc(),
          child: const LoginPage(),
        ),
        settings: const RouteSettings(name: LoginPage.routeName),
      );
    case OnBoardingPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const OnBoardingPage(),
        settings: const RouteSettings(name: OnBoardingPage.routeName),
      );
    case WelComePage.routeName:
      return MaterialPageRoute(
        builder: (_) => const WelComePage(),
        settings: const RouteSettings(name: WelComePage.routeName),
      );
    case SignUpPage.routeName:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (context) => SignUpCubit(),
          child: const SignUpPage(),
        ),
        settings: const RouteSettings(name: SignUpPage.routeName),
      );
    case ResetPasswordPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const ResetPasswordPage(),
        settings: const RouteSettings(name: ResetPasswordPage.routeName),
      );
    case NavBar.routeName:
      return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider<MenuCubit>(
              create: (context) => MenuCubit()..getCategories(CategoriesReq()),
            ),
          ],
          child: const NavBar(),
        ),
        settings: const RouteSettings(name: NavBar.routeName),
      );
    case SplashPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const SplashPage(),
        settings: const RouteSettings(name: SplashPage.routeName),
      );
    case IntroPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const IntroPage(),
        settings: const RouteSettings(name: IntroPage.routeName),
      );
  }
  return null;
};

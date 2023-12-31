import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/app/feature/cart/presentation/page/cart_page.dart';
import 'package:food_delivery/app/feature/checkout/presentation/page/checkout_page.dart';
import 'package:food_delivery/app/feature/home/data/model/categories_req.dart';
import 'package:food_delivery/app/feature/home/presentation/page/cubit/home_cubit.dart';
import 'package:food_delivery/app/feature/intro/presentation/page/intro_page.dart';
import 'package:food_delivery/app/feature/intro/presentation/page/on_boarding_page.dart';
import 'package:food_delivery/app/feature/payment/presentation/pages/payment_page.dart';
import 'package:food_delivery/app/feature/profile/presentation/pages/profile_page.dart';
import 'package:food_delivery/app/feature/reset_password/presentation/page/new_password_page.dart';
import 'package:food_delivery/app/feature/reset_password/presentation/page/otp_page.dart';
import 'package:food_delivery/app/feature/restaurant/data/model/restaurant_req.dart';
import 'package:food_delivery/app/feature/restaurant/presentation/page/res_detail_page.dart';
import 'package:food_delivery/app/feature/sign_up/presentation/cubit/sign_up_cubit.dart';
import 'package:food_delivery/app/feature/splash/presentation/page/splash_page.dart';
import '../feature/home/presentation/page/nav_bar.dart';
import '../feature/login/presentation/page/login_page.dart';
import '../feature/menu/cubit/menu_cubit.dart';
import '../feature/order/data/model/order_response.dart';
import '../feature/order/data/model/order_status.dart';
import '../feature/order/data/model/order_status_req.dart';
import '../feature/order/presentation/cubit/order_cubit.dart';
import '../feature/profile/presentation/cubit/user_cubit.dart';
import '../feature/reset_password/presentation/page/reset_password_page.dart';
import '../feature/restaurant/data/model/restaurant_model.dart';
import '../feature/sign_up/presentation/pages/sign_up_page.dart';
import '../feature/sign_up/presentation/pages/verify_page.dart';
import '../feature/welcome/presentation/page/welcome_page.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (settings) {
  switch (settings.name) {
    case LoginPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginPage(),
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
            BlocProvider<HomeCubit>(
              create: (context) =>
                  HomeCubit()..getAllRestaurant(RestaurantReq()),
            ),
            BlocProvider<OrderCubit>(
              create: (context) => OrderCubit()
                ..getOrderByStatus(OrderStatus(
                    page: "1",
                    size: "10",
                    status: OrderStatusState.UNPURCHASED.name)),
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
    case OtpPage.routeName:
      final OtpPageArg arg = settings.arguments as OtpPageArg;
      return MaterialPageRoute(
        builder: (_) => OtpPage(
          arg: arg,
        ),
        settings: const RouteSettings(name: OtpPage.routeName),
      );
    case NewPassWordPage.routeName:
      final OtpPageArg arg = settings.arguments as OtpPageArg;
      return MaterialPageRoute(
        builder: (_) => NewPassWordPage(
          arg: arg,
        ),
        settings: const RouteSettings(name: NewPassWordPage.routeName),
      );
    case VerifyAccountPage.routeName:
      final String email = settings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => VerifyAccountPage(
          email: email,
        ),
        settings: const RouteSettings(name: VerifyAccountPage.routeName),
      );
    case RestaurantDetailPage.routeName:
      final Restaurant res = settings.arguments as Restaurant;
      return MaterialPageRoute(
        builder: (_) => RestaurantDetailPage(
          res: res,
        ),
        settings: const RouteSettings(name: RestaurantDetailPage.routeName),
      );
    case ProfilePage.routeName:
      return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(providers: [
          BlocProvider<UserCubit>(
            create: (context) => UserCubit(),
          ),
        ], child: const ProfilePage()),
        settings: const RouteSettings(name: ProfilePage.routeName),
      );
    case CheckoutPage.routeName:
      final Order order = settings.arguments as Order;
      return MaterialPageRoute(
        builder: (_) => CheckoutPage(
          order: order,
        ),
        settings: const RouteSettings(name: CheckoutPage.routeName),
      );
    case CartPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const CartPage(),
        settings: const RouteSettings(name: CartPage.routeName),
      );
    case PaymentPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const PaymentPage(),
        settings: const RouteSettings(name: PaymentPage.routeName),
      );
  }
  return null;
};

import 'package:flutter/material.dart';
import 'package:food_delivery/app/feature/intro/presentation/page/intro_body.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  static const String routeName = "/intro";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IntroBody(),
    );
  }
}

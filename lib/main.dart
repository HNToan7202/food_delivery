import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_delivery/app/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:food_delivery/app/feature/multiple_language/presentation/cubit/multiple_language_cubit.dart';
import 'package:food_delivery/app/feature/user/cubit/user_cubit.dart';
import 'package:food_delivery/firebase_options.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'di.dart' as di;

import 'app/app.dart';

void main() async {
  await di.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBloc.storage = storage;

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<UserCubit>(
        create: (context) => UserCubit(),
      ),
      BlocProvider<MultipleLanguageCubit>(
        create: (context) => MultipleLanguageCubit(),
      ),
      BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(),
      ),
    ],
    child: const MyApp(),
  ));
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

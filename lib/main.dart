import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/quaran_app_cubit.dart';
import 'layout/Quaran_Home.dart';
import 'modules/onboarding_screen.dart';
import 'shared/constants.dart';
import 'shared/network/cashe_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CasheHelper.inite();
  var isClicked = CasheHelper.getData(key: 'isClicked') ?? false;

  runApp(MyApp(
    isClicked: isClicked,
  ));
}

class MyApp extends StatelessWidget {
  final bool isClicked;

  const MyApp({super.key, required this.isClicked});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuaranAppCubit>(
      create: (context) => QuaranAppCubit()
        ..getSewar()
        ..readSectionJson(context),
      child: BlocConsumer<QuaranAppCubit, QuaranAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: "القرأن الكريم",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                fontFamily: 'UthmanicHafs1 Ver13',
                primarySwatch: Colors.blue,
                appBarTheme: AppBarTheme(
                    elevation: 0.0, backgroundColor: MyColors.appBarColor)),
            home: isClicked ? QuaranHome() : OnboardingScreen(),
          );
        },
      ),
    );
  }
}

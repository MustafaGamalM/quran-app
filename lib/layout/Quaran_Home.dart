import 'package:circle_bottom_navigation_bar/circle_bottom_navigation_bar.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/quaran_app_cubit.dart';
import '../shared/constants.dart';

class QuaranHome extends StatefulWidget {
  @override
  State<QuaranHome> createState() => _QuaranHomeState();
}

class _QuaranHomeState extends State<QuaranHome> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuaranAppCubit, QuaranAppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var surahs = BlocProvider.of<QuaranAppCubit>(context).surahNameModel;
          return Scaffold(
            body: BlocProvider.of<QuaranAppCubit>(context)
                .screens[BlocProvider.of<QuaranAppCubit>(context).indexScreen],
            bottomNavigationBar: CircleBottomNavigationBar(
              circleOutline: -1.0,
              hasElevationShadows: false,
              blurShadowRadius: 0.0,
              barBackgroundColor: MyColors.bottomNavColor,
              initialSelection:
                  BlocProvider.of<QuaranAppCubit>(context).indexScreen,
              circleColor: Color.fromARGB(255, 67, 82, 81),
              activeIconColor: Colors.white,
              inactiveIconColor: MyColors.bottomNavIcon,
              onTabChangedListener: (int? v) {
                BlocProvider.of<QuaranAppCubit>(context).changeBottomNav(v);
              },
              tabs: [
                TabData(icon: Icons.queue_music),
                TabData(icon: Icons.read_more_sharp),
                TabData(icon: Icons.mosque),
              ],
            ),
          );
        });
  }
}

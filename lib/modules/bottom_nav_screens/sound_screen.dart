import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/quaran_app_cubit.dart';
import '../../shared/components/custom_app_bar.dart';
import '../../shared/components/shared_widget.dart';
import '../../shared/constants.dart';
import '../../shared/strings.dart';
import '../details_screens/sound_details_screen.dart';

class SoundScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return BlocBuilder<QuaranAppCubit, QuaranAppState>(
        builder: (context, state) {
      var sewar = BlocProvider.of<QuaranAppCubit>(context).surahNameModel;
      return FutureBuilder(
          future: BlocProvider.of<QuaranAppCubit>(context).getSewar(),
          builder: (context, snapshot) {
            if (sewar != null)
              return Scaffold(
                backgroundColor: MyColors.backGroundColor,
                appBar: PreferredSize(
                  child: CustomAppBar(
                    appBarText:
                        MyStrings.arabicString["sound_appbar_name"].toString(),
                    searchController: searchController,
                  ),
                  preferredSize: Size.fromHeight(heightScreen * .1),
                ),
                body: Padding(
                  padding: EdgeInsets.all(widthScreen * .02),
                  child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (_) {
                              return SoundDetailsScreen(
                                suraId: sewar.sewar[index].id,
                                suraName: sewar.sewar[index].name,
                              );
                            }));
                          },
                          child: soundSurahNameBuilder(
                            height: heightScreen,
                            isPortrait: isPortrait,
                            padding: widthScreen * .02,
                            surahName: '${sewar.sewar[index].name.toString()}',
                          )),
                      separatorBuilder: (context, index) => SizedBox(
                            height: heightScreen * .04,
                          ),
                      itemCount: sewar.sewar.length),
                ),
              );
            else
              return Container(
                  color: MyColors.backGroundColor,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        MyStrings.arabicString["alert_dialog_internet"]
                            .toString(),
                        style: TextStyle(
                            color: MyColors.textColor,
                            fontSize: heightScreen > 600 ? 28 : 23),
                      ),
                      SizedBox(height: heightScreen * .1),
                      CircularProgressIndicator()
                    ],
                  ));
          });
    });
  }
}

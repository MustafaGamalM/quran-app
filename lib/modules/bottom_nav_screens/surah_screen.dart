import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/quaran_app_cubit.dart';
import '../../shared/components/custom_app_bar.dart';
import '../../shared/components/shared_widget.dart';
import '../../shared/constants.dart';
import '../../shared/strings.dart';
import '../details_screens/surah_details.dart';

class SurahScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return BlocBuilder<QuaranAppCubit, QuaranAppState>(
      builder: (context, state) {
        var model = BlocProvider.of<QuaranAppCubit>(context);
        return Scaffold(
          backgroundColor: MyColors.backGroundColor,
          appBar: PreferredSize(
            child: CustomAppBar(
                appBarText:
                    MyStrings.arabicString["surah_appbar_name"].toString(),
                searchController: searchController,
                issurahScreen: true),
            preferredSize: Size.fromHeight(heightScreen * .1),
          ),
          body: Padding(
            padding: EdgeInsets.all(widthScreen * .02),
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) {
                          return SuraDetails(
                            surah: model.surahContentModelList[index].ar!,
                            surahName: model.surahContentModelList[index].name!,
                          );
                        }),
                      );
                    },
                    child: suraNameBuilder(
                        suraName: model.searchedSurahContentModelList.isEmpty
                            ? model.surahContentModelList[index].name!
                            : model.searchedSurahContentModelList[index].name!,
                        suraType: model.searchedSurahContentModelList.isEmpty
                            ? model.surahContentModelList[index].type!
                            : model.searchedSurahContentModelList[index].type!,
                        height: heightScreen,
                        isPortrait: isPortrait)),
                separatorBuilder: (context, index) => SizedBox(
                      height: heightScreen * .04,
                    ),
                itemCount: model.searchedSurahContentModelList.isEmpty
                    ? model.surahContentModelList.length
                    : model.searchedSurahContentModelList.length),
          ),
        );
      },
    );
  }
}

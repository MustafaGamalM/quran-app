import 'package:flutter/material.dart';

import '../../shared/constants.dart';
import '../../shared/strings.dart';

class SuraDetails extends StatelessWidget {
  final String surah;
  final String surahName;

  const SuraDetails({super.key, required this.surah, required this.surahName});
  @override
  Widget build(BuildContext context) {
    double _widthScreen = MediaQuery.of(context).size.width;
    double _heightScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: MyColors.backButtonColor,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: MyColors.backGroundColor,
      body: Container(
        margin: EdgeInsets.all(_widthScreen * .02),
        child: ListView(physics: BouncingScrollPhysics(), children: [
          Text(
            '${MyStrings.arabicString["prefix_surah_name"]} $surahName',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: MyColors.textColor,
              fontSize: _heightScreen > 600 ? 42 : 28,
            ),
          ),
          SizedBox(
            height: _heightScreen * .02,
          ),
          Text(
            surah,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: MyColors.textColor,
              fontSize: _heightScreen > 600 ? 29 : 22,
            ),
          )
        ]),
      ),
    );
  }
}

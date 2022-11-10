import 'package:flutter/material.dart';

import '../../models/prayer_date.dart';
import '../constants.dart';
import '../strings.dart';

Widget suraNameBuilder({
  required String suraName,
  required String suraType,
  required bool isPortrait,
  required height,
}) {
  return Container(
    height: isPortrait ? height * .16 : height * .3,
    width: double.infinity,
    padding: EdgeInsets.all(height * .03),
    decoration: BoxDecoration(
        color: MyColors.surahItemColor,
        borderRadius: BorderRadius.circular(15)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          suraType,
          style: TextStyle(
              color: MyColors.textColor, fontSize: height > 600 ? 19 : 14),
        ),
        Spacer(),
        Text(
          '${MyStrings.arabicString["prefix_surah_name"]} $suraName',
          style: TextStyle(
              color: MyColors.textColor,
              fontSize: height > 600 ? 28 : 23,
              fontWeight: FontWeight.normal),
        ),
      ],
    ),
  );
}

Widget soundSurahNameBuilder(
    {required String surahName,
    required double padding,
    required bool isPortrait,
    required height}) {
  return Container(
    width: double.infinity,
    height: isPortrait ? height * .16 : height * .3,
    padding: EdgeInsets.all(padding),
    decoration: BoxDecoration(
        color: MyColors.surahItemColor,
        borderRadius: BorderRadius.circular(15)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.record_voice_over,
          color: MyColors.SurahIcon,
        ),
        Spacer(),
        Text(
          '${MyStrings.arabicString["prefix_surah_name"]} $surahName',
          style: TextStyle(
              color: MyColors.textColor,
              fontSize: height > 600 ? 28 : 23,
              fontWeight: FontWeight.normal),
        ),
      ],
    ),
  );
}

Widget prayerDateContainerBuilder({
  required PrayerTimeModel model,
  required double widthScreen,
  required heightScreen,
}) {
  return Center(
    child: Container(
      height: heightScreen,
      width: widthScreen,
      padding: EdgeInsets.symmetric(
          horizontal: widthScreen * .01, vertical: heightScreen * .01),
      decoration: BoxDecoration(
        color: MyColors.ContainerprayerTimes,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
      ),
      child: SingleChildScrollView(
        child: DefaultTextStyle(
          style: TextStyle(
              color: MyColors.textColor,
              fontSize: heightScreen > 600 ? 22 : 17),
          child: Column(
            children: [
              SizedBox(
                height: heightScreen * .2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      '${model.data!.timings!.fajr} : ${MyStrings.arabicString["fajr"]}'),
                  Text(
                      '${model.data!.timings!.dhuhr} : ${MyStrings.arabicString["dhuhr"]}'),
                  Text(
                      '${model.data!.timings!.asr} : ${MyStrings.arabicString["asr"]}'),
                ],
              ),
              SizedBox(
                height: heightScreen * .08,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                      '${model.data!.timings!.maghrib} : ${MyStrings.arabicString["maghrib"]}'),
                  Text(
                      '${model.data!.timings!.isha} : ${MyStrings.arabicString["isha"]} ')
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

showAlertDialog(BuildContext context, String text) {
  Widget okButton = TextButton(
    child: Text(text),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text('${MyStrings.arabicString["alert_dialog_location"]}'),
    actions: [
      okButton,
    ],
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

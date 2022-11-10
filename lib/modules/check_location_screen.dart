import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../cubit/quaran_app_cubit.dart';
import '../shared/components/shared_widget.dart';
import '../shared/constants.dart';
import '../shared/strings.dart';

class CheckLocationScreen extends StatelessWidget {
  Future<Position> getPosition(BuildContext context) async {
    bool isServiceEnabled;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (isServiceEnabled == false) {
      showAlertDialog(
          context, MyStrings.arabicString["button_dialog_location"].toString());
      return Future.error('Location services are disabled.');
    } else {
      LocationPermission? per;
      per = await Geolocator.checkPermission();
      if (per == LocationPermission.denied) {
        per = await Geolocator.requestPermission();
        if (per == LocationPermission.always) {
          return await Geolocator.getCurrentPosition();
        }
      }
      if (per == LocationPermission.deniedForever) {
        per = await Geolocator.requestPermission();
        if (per == LocationPermission.always) {
          return await Geolocator.getCurrentPosition();
        }
      }

      return await Geolocator.getCurrentPosition();
    }
  }

  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    return BlocBuilder<QuaranAppCubit, QuaranAppState>(
      builder: (context, state) {
        return Container(
          color: MyColors.backGroundColor,
          child: Center(
              child: MaterialButton(
            elevation: 1,
            padding: EdgeInsets.all(heigth * .03),
            color: MyColors.buttonLocationColor,
            child: Text(
              '${MyStrings.arabicString["add_location_button"]}',
              style: TextStyle(
                  color: MyColors.textColor, fontSize: heigth > 600 ? 19 : 12),
            ),
            onPressed: () async {
              Position position = await getPosition(context);
              List<Placemark> placeMark = await placemarkFromCoordinates(
                  position.latitude, position.longitude);
              BlocProvider.of<QuaranAppCubit>(context)
                  .getPrayerTime(cityName: placeMark[0].administrativeArea!);
            },
          )),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../cubit/quaran_app_cubit.dart';
import '../../shared/components/custom_app_bar.dart';
import '../../shared/components/shared_widget.dart';
import '../../shared/constants.dart';
import '../../shared/strings.dart';
import '../check_location_screen.dart';

class DataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    TextEditingController searchController = TextEditingController();

    return BlocBuilder<QuaranAppCubit, QuaranAppState>(
      builder: (context, state) {
        var cubit = BlocProvider.of<QuaranAppCubit>(context).prayerTime;
        if (cubit == null) {
          return CheckLocationScreen();
        } else {
          return Scaffold(
            backgroundColor: MyColors.backGroundColor,
            appBar: PreferredSize(
              child: CustomAppBar(
                appBarText:
                    MyStrings.arabicString["date_appbar_name"].toString(),
                searchController: searchController,
              ),
              preferredSize: Size.fromHeight(heightScreen * .1),
            ),
            body: Container(
              padding: EdgeInsets.all(widthScreen * .02),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: heightScreen * .01,
                    ),
                    Container(
                      height: heightScreen * .43,
                      width: widthScreen * .9,
                      decoration: BoxDecoration(
                        color: MyColors.ContainerprayerTimes,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                      ),
                      child: SfDateRangePicker(
                        yearCellStyle: DateRangePickerYearCellStyle(
                            textStyle: TextStyle(color: MyColors.textColor)),
                        monthCellStyle: DateRangePickerMonthCellStyle(
                            textStyle: TextStyle(color: MyColors.textColor)),
                        headerStyle: DateRangePickerHeaderStyle(
                            textStyle: TextStyle(
                                color: MyColors.textColor, fontSize: 19)),
                        initialSelectedRange: PickerDateRange(
                            DateTime.now().subtract(const Duration(days: 4)),
                            DateTime.now().add(const Duration(days: 3))),
                      ),
                    ),
                    SizedBox(
                      height: heightScreen * .025,
                    ),
                    prayerDateContainerBuilder(
                      model: cubit,
                      widthScreen: widthScreen * .9,
                      heightScreen: heightScreen * .2,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

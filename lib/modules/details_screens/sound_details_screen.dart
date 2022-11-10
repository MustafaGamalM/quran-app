import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/components/shared_widget.dart';
import '../../shared/constants.dart';

import '../../cubit/quaran_app_cubit.dart';
import '../../shared/strings.dart';

class SoundDetailsScreen extends StatefulWidget {
  final int suraId;
  final String suraName;
  const SoundDetailsScreen(
      {super.key, required this.suraId, required this.suraName});
  @override
  State<SoundDetailsScreen> createState() => _SoundDetailsScreenState();
}

class _SoundDetailsScreenState extends State<SoundDetailsScreen> {
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void initState() {
    BlocProvider.of<QuaranAppCubit>(context).setUpAudio(id: widget.suraId);
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    return BlocConsumer<QuaranAppCubit, QuaranAppState>(
      listener: (context, state) {
        if (state is SetUpAudioError ||
            state is SetUpAudioError ||
            state is SetUpAudioError)
          showAlertDialog(context,
              MyStrings.arabicString["alert_dialog_internet"].toString());
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MyColors.backGroundColor,
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: MyColors.backButtonColor,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(widthScreen * .01),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${MyStrings.arabicString["prefix_surah_name"]} ${widget.suraName}',
                    style: TextStyle(
                        color: MyColors.textColor,
                        fontSize: heightScreen > 500 ? 30 : 19,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: heightScreen * .015,
                  ),
                  Image.asset(
                    'assets/images/quran.png',
                    width: widthScreen - 10,
                    height: isPortrait ? heightScreen * .6 : heightScreen * .4,
                  ),
                  SizedBox(
                    height: heightScreen * .015,
                  ),
                  IconButton(
                    color: MyColors.SurahIcon,
                    onPressed: () {
                      BlocProvider.of<QuaranAppCubit>(context)
                          .checkSoundRunning(widget.suraId);
                    },
                    icon: Icon(
                      BlocProvider.of<QuaranAppCubit>(context).isPlayed == true
                          ? Icons.pause
                          : Icons.play_arrow,
                      size: 45,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

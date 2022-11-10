import 'dart:convert';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/prayer_date.dart';
import '../models/surah_content.dart';
import '../models/surah_name_model.dart';
import '../modules/bottom_nav_screens/date_screen.dart';
import '../modules/bottom_nav_screens/sound_screen.dart';
import '../modules/bottom_nav_screens/surah_screen.dart';
import '../shared/network/api_services.dart';

part 'quaran_app_state.dart';

class QuaranAppCubit extends Cubit<QuaranAppState> {
  QuaranAppCubit() : super(QuaranAppInitial());
  static QuaranAppCubit get(context) => BlocProvider.of(context);
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  int indexScreen = 1;

  List<Widget> screens = [
    SoundScreen(),
    SurahScreen(),
    DataScreen(),
  ];

  changeBottomNav(int? index) {
    indexScreen = index!;
    emit(ChangeBottomNavState());
  }

  bool isPlayed = false;
  int lasiId = -1;
  checkSoundRunning(int id) {
    isPlayed = !isPlayed;
    isPlayed == true ? playMusic(id) : pauseMusic();
    lasiId = id;
    emit(CheckSound());
  }

  playMusic(int id) async {
    await audioPlayer.play().then((value) {
      emit(SoundPlaying());
    }).catchError((e) {
      isPlayed = !isPlayed;
      print('error');
      print(e.toString());
      emit(SetUpAudioError());
    });
  }

  pauseMusic() async {
    await audioPlayer
        .pause()
        .then((value) => emit(SoundPaused()))
        .catchError((e) {
      isPlayed = !isPlayed;
      print('error');
      print(e.toString());
      emit(SetUpAudioError());
    });
  }

  void setUpAudio({required int id}) {
    String suwraId = id < 10
        ? '00$id'
        : id > 10 && id < 100
            ? '0$id'
            : id.toString();
    if (lasiId != id) {
      audioPlayer
          .open(Playlist(audios: [
        Audio.network('https://server8.mp3quran.net/jbrl/$suwraId.mp3',
            metas: Metas(title: 'est1', artist: 'test1')),
      ]))
          .then((value) {
        lasiId = id;
        isPlayed = true;
        emit(SetUpSoundSucced());
      }).catchError((e) {
        print('error');
        print(e.toString());
        emit(SetUpAudioError());
      });
    }
  }

// get prayer time
  PrayerTimeModel? prayerTime;
  getPrayerTime({required String cityName}) {
    emit(GetPrayerTimeLoading());
    DioHelper.getData(
            url: 'http://api.aladhan.com/v1/timingsByAddress?address=$cityName')
        .then((value) {
      prayerTime = PrayerTimeModel.fromJson(value.data);
      emit(GetPrayerTimeSucceed());
    }).catchError((e) {
      emit(GetPrayerTimeError());
    });
  }

  // get surah name
  SurahNameModel? surahNameModel;
  getSewar() {
    DioHelper.getData(url: 'https://mp3quran.net/api/v3/suwar').then((value) {
      surahNameModel = SurahNameModel.fromJson(value.data);

      emit(GetSurahSucessedState());
    }).catchError((e) {
      emit(GetSurahErrorState());
    });
  }

  // get searced surah content
  List<SurahContentModel> searchedSurahContentModelList = [];
  getSearchedText(String text) {
    searchedSurahContentModelList = surahContentModelList
        .where((element) => element.name!.contains(text))
        .toList();

    emit(GetSearchedsurah());
  }

  // get content surahs

  List<SurahContentModel> surahContentModelList = [];
  void readSectionJson(BuildContext context) {
    surahContentModelList = [];
    DefaultAssetBundle.of(context)
        .loadString('assets/quran_text/quran.json')
        .then((value) {
      var res = json.decode(value);
      res.forEach((element) {
        surahContentModelList.add(SurahContentModel.fromJson(element));
      });
      emit(GetSurahContentSucceed());
    }).catchError((error) {
      emit(GetSurahContentError());
    });
  }
}

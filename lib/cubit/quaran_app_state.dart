part of 'quaran_app_cubit.dart';

@immutable
abstract class QuaranAppState {}

class QuaranAppInitial extends QuaranAppState {}

// get Sewar
class GetSurahSucessedState extends QuaranAppState {}

class GetSurahErrorState extends QuaranAppState {}

// setUpsound
class SetUpSoundSucced extends QuaranAppState {}

class SetUpAudioError extends QuaranAppState {}

class CheckSound extends QuaranAppState {}

class SoundPlaying extends QuaranAppState {}

class SoundPaused extends QuaranAppState {}

//change botttm nav state
class ChangeBottomNavState extends QuaranAppState {}

class GetSurahContentSucceed extends QuaranAppState {}

class GetSurahContentError extends QuaranAppState {}

class ChickedSound extends QuaranAppState {}

//get Searched surah
class GetSearchedsurah extends QuaranAppState {}

// salah data

class GetPrayerTimeLoading extends QuaranAppState {}

class GetPrayerTimeError extends QuaranAppState {}

class GetPrayerTimeSucceed extends QuaranAppState {}

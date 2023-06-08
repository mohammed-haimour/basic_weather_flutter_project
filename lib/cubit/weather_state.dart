part of 'weather_cubit.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherSucsses extends WeatherState {}

class WeatherFailer extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

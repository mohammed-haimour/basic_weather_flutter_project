import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/model/weather_model.dart';

import '../services/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  WeatherModel? weatherModel;
  String? myCity;
  Future<void> getWetherData(String city) async {
    myCity = city;
    try {
      emit(WeatherIsLoading());
      weatherModel = await WetherServise().getWetherData(city);
      emit(WeatherSucsses());
    } catch (err) {
      print(err);
      emit(WeatherFailer());
    }
  }
}

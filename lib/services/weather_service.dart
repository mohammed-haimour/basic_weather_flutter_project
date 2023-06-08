import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WetherServise {
  Future<WeatherModel> getWetherData(String city) async {
    const baseUrl = 'http://api.weatherapi.com';
    const key = 'c542ed6d612f4821bfd144924231805';
    http.Response response = await http.get(
      Uri.parse('$baseUrl/v1/forecast.json?key=$key&q=$city&days=1'),
    );
    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weatherModelData = WeatherModel.fromJson(data);
    return weatherModelData; 
  }
}

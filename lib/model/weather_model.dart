class WeatherModel {
  final String date;
  final num temp;
  final num minTemp;
  final num maxTemp;
  final String weatherStateName;
  final String image;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.weatherStateName,
      required this.image});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
      date: data['location']['localtime'],
      temp: jsonData['avgtemp_c'],
      minTemp: jsonData['mintemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      weatherStateName: jsonData['condition']['text'],
      image: jsonData['condition']['icon'],
    );
  }

  @override
  String toString() {
    return "date = $date , temp = $temp , minTemp=$minTemp, maxTemp=$maxTemp,weatherStateName=$weatherStateName";
  }
}

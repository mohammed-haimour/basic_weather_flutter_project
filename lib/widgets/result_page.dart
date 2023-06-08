import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';

class ResultPage extends StatelessWidget {
  WeatherModel weatherModel;
  String city; 
  ResultPage({required this.weatherModel,required this.city});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  city,
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
                Text(weatherModel.date.toString(),
                    style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network(
                  "https:${weatherModel.image}",
                  width: 100,
                ),
                Text("temp : ${weatherModel.temp}",
                    style: const TextStyle(fontSize: 25)),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "min :${weatherModel.minTemp}",
                      style: const TextStyle(
                          fontSize: 26,
                          color: Color.fromRGBO(144, 244, 135, 1)),
                    ),
                    Text(
                      "max : ${weatherModel.maxTemp}",
                      style: const TextStyle(
                          fontSize: 25,
                          color: Color.fromRGBO(239, 112, 112, 1)),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Text('${weatherModel.temp}',
                style: const TextStyle(fontSize: 55)),
          ),
        ],
      ),
    );
  }
}

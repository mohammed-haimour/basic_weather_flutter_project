import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/widgets/result_page.dart';
import 'package:weather_app/widgets/search_page.dart';

import '../cubit/weather_cubit.dart';

// ignore: camel_case_types, must_be_immutable
class HomePage extends StatelessWidget {
  String? cityName;
  String? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weathr'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) {
                  return SearchPage();
                },
              ));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherIsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSucsses) {
            WeatherModel weatherModel =
                BlocProvider.of<WeatherCubit>(context).weatherModel!;
            print(weatherModel);
            String city = BlocProvider.of<WeatherCubit>(context).myCity!;
            print(city);
            return ResultPage(
              weatherModel: weatherModel,
              city: city,
            );
          } else if (state is WeatherFailer) {
            return Center(
              child: Text('there is an error'),
            );
          } else {
            return const Center(
              child: Text(
                'Ther is no wheather Start esearch now !',
              ),
            );
          }
        },
      ),
    );
  }
}

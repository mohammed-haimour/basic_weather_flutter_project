import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/widgets/home_page.dart';

void main() {
  runApp(WeahterApp());
}

class WeahterApp extends StatelessWidget {
  const WeahterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            onFieldSubmitted: (data)async{
              await BlocProvider.of<WeatherCubit>(context).getWetherData(data);
              Navigator.pop(context);
            },
            cursorColor: Colors.white,
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              hintText: 'Enter a City Name ',
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

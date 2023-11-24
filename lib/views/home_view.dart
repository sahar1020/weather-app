import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterappwether/cubits/get_weather_cubit/get_weather_cupit.dart';
import 'package:flutterappwether/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:flutterappwether/views/search_view.dart';
import 'package:flutterappwether/widgets/no_weather_body.dart';
import 'package:flutterappwether/widgets/weather_info_body.dart';



class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SearchView();
                  },
                ),
              );
            },
            icon: Icon(
              Icons.search,
            ),
          )
        ],
        title: const Text('Weather App'),
      ),
      body:  BlocBuilder< GetWeatherCubit, WeatherState>(

        builder: (context, state) {
          if(state is NoWeatherState){
            return NoWeatherBody();
          } else if (state is WeatherLodedState){
            return WeatherInfoBody(
              weather: state.weatehermodel,
            );
          }else return Text("opps there was an error");
        },
      )
     
    );
  }
}

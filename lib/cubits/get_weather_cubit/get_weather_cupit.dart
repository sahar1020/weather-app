
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterappwether/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:flutterappwether/models/weather_model.dart';
import '../../services/weather_services.dart';


class GetWeatherCubit extends Cubit<WeatherState>{
  GetWeatherCubit():super(NoWeatherState());



 WeatherModel? weatherModel;
  getWeather({required String cityName})async{
 
    try {
   weatherModel=
  await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);
  emit(WeatherLodedState(weatherModel!));
}  catch (e) {
   emit(WeatherFailuerState());
}

  }
}


import 'package:flutterappwether/models/weather_model.dart';

class WeatherState{}
class NoWeatherState  extends WeatherState {}
class WeatherLodedState  extends WeatherState{
  final WeatherModel weatehermodel;

  WeatherLodedState(this.weatehermodel);
}
class WeatherFailuerState  extends WeatherState{}     
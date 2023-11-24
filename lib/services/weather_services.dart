

import 'package:dio/dio.dart';
import 'package:flutterappwether/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'd5049f5a0d4e47cf874203835230911';

  WeatherServices(this.dio);
  Future<WeatherModel> getCurrentWeather({required cityName}) async {
    try {
      //https://api.weatherapi.com/v1/forecast.json?key=d5049f5a0d4e47cf874203835230911&q=misurata&days=1
      Response response = await dio
          .get('https://api.weatherapi.com/v1/forecast.json?key=d5049f5a0d4e47cf874203835230911&q=$cityName&days=1');
      WeatherModel weathermodel = WeatherModel.fromJson(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String errorMassage = e.response?.data['error']['massage'] ??
          'oops there was an error ,try later';
      throw Exception(errorMassage);
     }
    // catch (e) {
    //   log(e.toString());
    //   throw Exception('oops there was an error ,try later');
    // }
  }
}

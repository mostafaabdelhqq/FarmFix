import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:farmfix/features/home/data/model/weather_model.dart';
import 'package:location/location.dart'; // استخدم location بدل geolocator
import 'package:meta/meta.dart';

import '../../../../location_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  final Dio dio = Dio();
  final String apiKey = 'ca5fe25807b64b65a79132932250705';
  final Location location = Location();

  Future<void> fetchWeather() async {
    emit(WeatherLoading());
    try {
      final locData = await LocationService().getLocation();

      final response = await dio.get(
        'https://api.weatherapi.com/v1/forecast.json',
        queryParameters: {
          'key': apiKey,
          'q': '${locData.latitude},${locData.longitude}',
          'days': 7,
          'aqi': 'no',
          'alerts': 'no',
        },
      );

      WeatherModel weather = WeatherModel.fromJson(response.data);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }

}

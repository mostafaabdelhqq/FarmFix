import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:farmfix/features/home/data/model/weather_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  final Dio dio = Dio();
  final String apiKey = 'ca5fe25807b64b65a79132932250705';

  Future<void> fetchWeather() async {
    emit(WeatherLoading());
    try {
      Position position = await _determinePosition();
      final response = await dio.get(
        'https://api.weatherapi.com/v1/forecast.json',
        queryParameters: {
          'key': apiKey,
          'q': '${position.latitude},${position.longitude}',
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

  Future<Position> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever ||
          permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied.');
      }
    }

    return await Geolocator.getCurrentPosition();
  }
}

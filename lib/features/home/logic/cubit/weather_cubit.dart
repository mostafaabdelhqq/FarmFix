import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:farmfix/features/home/data/model/weather_model.dart';
import 'package:location/location.dart'; // استخدم location بدل geolocator
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  final Dio dio = Dio();
  final String apiKey = 'ca5fe25807b64b65a79132932250705';
  final Location location = Location();

  Future<void> fetchWeather() async {
    emit(WeatherLoading());
    try {
      final locData = await _determineLocation();

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

  Future<LocationData> _determineLocation() async {
    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        throw Exception('Location permissions are denied.');
      }
    }

    return await location.getLocation();
  }
}

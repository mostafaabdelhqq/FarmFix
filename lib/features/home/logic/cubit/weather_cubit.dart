import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:farmfix/features/home/data/model/weather_model.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  bool _hasFetched = false;

  WeatherCubit() : super(WeatherInitial());

  final Dio dio = Dio();
  final String apiKey = 'ca5fe25807b64b65a79132932250705';
  final Location location = Location();
  final lang = Intl.getCurrentLocale();

  Future<void> fetchWeather() async {
    if (_hasFetched) return;

    emit(WeatherLoading());
    try {
      final locData = await _determineLocation();
      final latitude = locData.latitude;
      final longitude = locData.longitude;

      final response = await dio.get(
        'https://api.weatherapi.com/v1/forecast.json',
        queryParameters: {
          'key': apiKey,
          'q': '$latitude,$longitude',
          'days': 7,
          'aqi': 'no',
          'alerts': 'no',
          'lang': lang,
        },
      );

      WeatherModel weather = WeatherModel.fromJson(response.data);

      _hasFetched = true;
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

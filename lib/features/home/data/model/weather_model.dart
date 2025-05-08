import 'package:farmfix/core/utils/assets_data.dart';

class WeatherModel {
  String cityName;
  String icon;
  double avgTemp;
  double maxTemp;
  double minTemp;
  String weatherState;
  String avgHumidity;
  String precipitation;
  String windSpeed;
  WeatherModel(
      {required this.cityName,
      required this.avgHumidity,
      required this.precipitation,
      required this.windSpeed,
      required this.icon,
      required this.avgTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherState});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonPath = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        cityName: data['location']['name'].toString(),
        avgHumidity: jsonPath['avghumidity'].toString(),
        precipitation: jsonPath['totalprecip_mm'].toString(),
        windSpeed: jsonPath['maxwind_kph'].toString(),
        icon: data['current']['condition']['icon'].toString(),
        avgTemp: jsonPath['avgtemp_c'],
        maxTemp: jsonPath['maxtemp_c'],
        minTemp: jsonPath['mintemp_c'],
        weatherState: jsonPath['condition']['text'].toString());
  }
  @override
  String toString() {
    return 'ciytname=$cityName ,icon=$icon, avgtemp=$avgTemp , maxtemp=$maxTemp , mintemp=$minTemp ,weatherstate=$weatherState , avgHumidity=$avgHumidity , precipitation=$precipitation';
  }

  String getWeather() {
    if (weatherState == 'Clear' || weatherState == 'Light Cloud') {
      return AssetsData.clear;
    } else if (weatherState == 'Sleet' ||
        weatherState == 'Snow' ||
        weatherState == 'Hail') {
      return AssetsData.thunderstorm;
    } else if (weatherState == 'Heavy Cloud' ||
        weatherState == 'Partly Cloudy ') {
      return AssetsData.cloudy;
    } else if (weatherState == 'Heavy Rain' ||
        weatherState == 'Light Rain' ||
        weatherState == 'Showers' ||
        weatherState == 'Patchy rain nearby' ||
        weatherState == 'Moderate rain') {
      return AssetsData.thunderstorm;
    } else if (weatherState == 'Thunderstorm' || weatherState == 'Thunder') {
      return AssetsData.thunderstorm;
    } else {
      return AssetsData.cloudy;
    }
  }
}

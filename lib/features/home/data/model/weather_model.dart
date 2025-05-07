class WeatherModel {
  String cityName;
  String icon;
  double avgTemp;
  double maxTemp;
  double minTemp;
  String weatherState;
  String avgHumidity;
  String precipitation;
  WeatherModel(
      {required this.cityName,
      required this.avgHumidity,
      required this.precipitation,
      required this.icon,
      required this.avgTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherState});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonPath = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        cityName: data['location']['name'],
        avgHumidity: jsonPath['avghumidity'],
        precipitation: jsonPath['totalprecip_mm'],
        icon: data['current']['condition']['icon'],
        avgTemp: jsonPath['avgtemp_c'],
        maxTemp: jsonPath['maxtemp_c'],
        minTemp: jsonPath['mintemp_c'],
        weatherState: jsonPath['condition']['text']);
  }
  @override
  String toString() {
    return 'ciytname=$cityName ,icon=$icon, avgtemp=$avgTemp , maxtemp=$maxTemp , mintemp=$minTemp ,weatherstate=$weatherState , avgHumidity=$avgHumidity , precipitation=$precipitation';
  }

  String getWeather() {
    if (weatherState == 'Clear' || weatherState == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherState == 'Sleet' ||
        weatherState == 'Snow' ||
        weatherState == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherState == 'Heavy Cloud' ||
        weatherState == 'Partly Cloudy ') {
      return 'assets/images/cloudy.png';
    } else if (weatherState == 'Heavy Rain' ||
        weatherState == 'Light Rain' ||
        weatherState == 'Showers' ||
        weatherState == 'Patchy rain nearby' ||
        weatherState == 'Moderate rain') {
      return 'assets/images/rainy.png';
    } else if (weatherState == 'Thunderstorm' || weatherState == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }
}

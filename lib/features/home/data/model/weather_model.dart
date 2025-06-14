import 'package:farmfix/core/utils/assets_data.dart';

class WeatherModel {
  String cityNameEn;
  String cityNameAr;
  String icon;
  double avgTemp;
  double maxTemp;
  double minTemp;
  String weatherState;
  String avgHumidity;
  String precipitation;
  String windSpeed;

  WeatherModel({
    required this.cityNameEn,
    required this.cityNameAr,
    required this.avgHumidity,
    required this.precipitation,
    required this.windSpeed,
    required this.icon,
    required this.avgTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherState,
  });

  factory WeatherModel.fromJson(dynamic data) {
    var jsonPath = data['forecast']['forecastday'][0]['day'];
    String cityNameEn = data['location']['name'].toString();

    // خريطة ترجمة المدن
    final Map<String, String> cityNameTranslations = {
      'Cairo': 'القاهرة',
      'Alexandria': 'الإسكندرية',
      'Giza': 'الجيزة',
      'Tanta': 'طنطا',
      'Mansoura': 'المنصورة',
      'Aswan': 'أسوان',
      'Asyut': 'أسيوط',
      'Zagazig': 'الزقازيق',
      'Fayoum': 'الفيوم',
      'Ismailia': 'الإسماعيلية',
      'Suez': 'السويس',
      'Port Said': 'بورسعيد',
      'Damietta': 'دمياط',
      'Luxor': 'الأقصر',
      'Qena': 'قنا',
      'Beni Suef': 'بني سويف',
      'Minya': 'المنيا',
      'Damanhur': 'دمنهور',
      'Kafr El Sheikh': 'كفر الشيخ',
      'Sohag': 'سوهاج',
      'Hurghada': 'الغردقة',
      'Shibin El Kom': 'شبين الكوم',
      'Banha': 'بنها',
      'Mersa Matruh': 'مرسى مطروح',
      'Arish': 'العريش',
      'Dakhla': 'الواحات الداخلة',
      'Siwa': 'سيوة',
      'Borg El Arab': 'برج العرب',
      'Qalyubia': 'القليوبية',
      'Kafr El Dawwar': 'كفر الدوار',
      'Mountain View': 'ماونتن ڤيو',
    };

    return WeatherModel(
      cityNameEn: cityNameEn,
      cityNameAr: cityNameTranslations[cityNameEn] ?? cityNameEn,
      avgHumidity: jsonPath['avghumidity'].toString(),
      precipitation: jsonPath['totalprecip_mm'].toString(),
      windSpeed: jsonPath['maxwind_kph'].toString(),
      icon: data['current']['condition']['icon'].toString(),
      avgTemp: jsonPath['avgtemp_c'],
      maxTemp: jsonPath['maxtemp_c'],
      minTemp: jsonPath['mintemp_c'],
      weatherState: jsonPath['condition']['text'].toString(),
    );
  }

  @override
  String toString() {
    return 'cityNameAr=$cityNameAr, cityNameEn=$cityNameEn, icon=$icon, avgTemp=$avgTemp, maxTemp=$maxTemp, minTemp=$minTemp, weatherState=$weatherState, avgHumidity=$avgHumidity, precipitation=$precipitation, windSpeed=$windSpeed';
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

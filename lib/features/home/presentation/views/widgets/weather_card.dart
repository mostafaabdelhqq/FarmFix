import 'package:farmfix/constants.dart';
import 'package:farmfix/core/utils/extensions.dart';
import 'package:farmfix/features/home/data/model/weather_model.dart';
import 'package:farmfix/features/home/logic/cubit/weather_cubit.dart';
import 'package:farmfix/features/home/presentation/views/widgets/loading_weather_card.dart';
import 'package:farmfix/features/home/presentation/views/widgets/weather_data.dart';
import 'package:farmfix/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:intl/intl.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return const LoadingWeatherCard();
        } else if (state is WeatherLoaded) {
          WeatherModel weather = state.weather;
          return Container(
            width: 410.w,
            height: 310.h,
            decoration: BoxDecoration(
              color: const Color(0xff009951).withOpacity(.5),
              borderRadius: BorderRadius.circular(35.r),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff000000).withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 7,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          Intl.getCurrentLocale() == 'en'
                              ? weather.cityNameEn
                              : weather.cityNameAr,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Text(
                            Localizations.localeOf(context).languageCode == 'en'
                                ? '${weather.avgTemp.toInt()}°'
                                : '${convertToArabicNumbers(weather.avgTemp.toInt().toString())}°',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w600,
                              fontSize: 60.sp,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              Localizations.localeOf(context).languageCode ==
                                      'en'
                                  ? '${S.of(context).highTemp}:${weather.maxTemp.toInt()}°'
                                  : '${S.of(context).highTemp}:${convertToArabicNumbers(weather.maxTemp.toInt().toString())}°',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: Localizations.localeOf(context)
                                            .languageCode ==
                                        'en'
                                    ? 15.sp
                                    : 15.sp,
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Text(
                              Localizations.localeOf(context).languageCode ==
                                      'en'
                                  ? '${S.of(context).lowTemp}:${weather.minTemp.toInt()}°'
                                  : '${S.of(context).lowTemp}:${convertToArabicNumbers(weather.minTemp.toInt().toString())}°',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: Localizations.localeOf(context)
                                            .languageCode ==
                                        'en'
                                    ? 15.sp
                                    : 15.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Image.asset(
                        weather.getWeather(), // من الـ API
                        width: 230.w,
                        height: 200.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: kSecondaryColor,
                  thickness: 1.5,
                  height: 20.h,
                  indent: 10.w,
                  endIndent: 10.w,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WeatherData(
                          weatherIcon: Mdi.weather_heavy_rain,
                          weatherDataType: S.of(context).precipitation,
                          weatherDataValue: Localizations.localeOf(context)
                                      .languageCode ==
                                  'en'
                              ? '${weather.precipitation} ${S.of(context).mm}'
                              : '${convertToArabicNumbers(weather.precipitation.toString())} ${S.of(context).mm}',
                        ),
                        // SizedBox(width: 40.w),
                        VerticalDivider(
                          color: kSecondaryColor,
                          thickness: 1.5,
                          width: 10.h,
                        ),
                        WeatherData(
                          weatherIcon: Mdi.weather_windy,
                          weatherDataType: S.of(context).wind,
                          weatherDataValue: Localizations.localeOf(context)
                                      .languageCode ==
                                  'en'
                              ? '${weather.windSpeed} ${S.of(context).kmh}'
                              : '${convertToArabicNumbers(weather.windSpeed.toString())} ${S.of(context).kmh}',
                        ),
                        // SizedBox(width: 35.w),
                        VerticalDivider(
                          color: kSecondaryColor,
                          thickness: 1.5,
                          width: 10.h,
                        ),
                        WeatherData(
                          weatherIcon: Ion.water,
                          weatherDataType: S.of(context).humidity,
                          weatherDataValue: Localizations.localeOf(context)
                                      .languageCode ==
                                  'en'
                              ? '${weather.avgHumidity}%'
                              : '${convertToArabicNumbers(weather.avgHumidity.toString())}%',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        } else if (state is WeatherError) {
          return Center(child: Text('Error: ${state.message}'));
        } else {
          return const Center(child: Text('No data'));
        }
      },
    );
  }
}

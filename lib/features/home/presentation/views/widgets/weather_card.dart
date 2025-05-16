import 'package:farmfix/constants.dart';
import 'package:farmfix/features/home/data/model/weather_model.dart';
import 'package:farmfix/features/home/logic/cubit/weather_cubit.dart';
import 'package:farmfix/features/home/presentation/views/widgets/weather_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/icons/ion.dart';
import 'package:iconify_flutter/icons/mdi.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherLoading) {
          return  Center(child: CircularProgressIndicator(color: const Color(0xff009951).withOpacity(.5),));
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
                          weather.cityName,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.w),
                          child: Text(
                            '${weather.avgTemp.toInt()}°',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w600,
                              fontSize: 60.sp,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'H:${weather.maxTemp.toInt()}°',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Text(
                              'L:${weather.minTemp.toInt()}°',
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
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
                          weatherDataType: 'Precipitation',
                          weatherDataValue: '${weather.precipitation} mm',
                        ),
                        // SizedBox(width: 40.w),
                        VerticalDivider(
                          color: kSecondaryColor,
                          thickness: 1.5,
                          width: 10.h,
                        ),
                        WeatherData(
                          weatherIcon: Mdi.weather_windy,
                          weatherDataType: 'Wind',
                          weatherDataValue:
                              '${weather.windSpeed} KM/H', // لو عندك داتا حقيقية بدلها
                        ),
                        // SizedBox(width: 35.w),
                        VerticalDivider(
                          color: kSecondaryColor,
                          thickness: 1.5,
                          width: 10.h,
                        ),
                        WeatherData(
                          weatherIcon: Ion.water,
                          weatherDataType: 'Humidity',
                          weatherDataValue: '${weather.avgHumidity}%',
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

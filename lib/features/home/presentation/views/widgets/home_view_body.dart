import 'package:farmfix/constants.dart';
import 'package:farmfix/core/utils/app_routes.dart';
import 'package:farmfix/core/utils/assets_data.dart';
import 'package:farmfix/features/home/presentation/views/widgets/custom_calculator.dart';
import 'package:farmfix/features/home/presentation/views/widgets/weather_card.dart';
import 'package:farmfix/features/home/presentation/views/widgets/welcome_message_and_profile_setting.dart';
import 'package:farmfix/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_carousel/infinite_carousel.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

List<CustomCalculator> calculatorsList(BuildContext context) => [
      CustomCalculator(
        onPressed: () {
          GoRouter.of(context).push(AppRoutes.kPlantDensityCalculator);
        },
        fontSize: 15,
        dataName1: S.of(context).rowSpacing,
        dataName2: S.of(context).plantSpacing,
        dataName3: S.of(context).landArea,
        purposeOfCalculation: S.of(context).idealCropCoverage,
        calculationIcon: AssetsData.grassIcon,
        calculationName: S.of(context).plantDensity,
        calculationDescription: S.of(context).plantDensityDesc,
      ),
      CustomCalculator(
        onPressed: () {
          GoRouter.of(context).push(AppRoutes.kTotalProductionCostCalculator);
        },
        fontSize: 15,
        dataName1: S.of(context).seeds,
        dataName2: S.of(context).fertilizers,
        dataName3: S.of(context).labor,
        purposeOfCalculation: S.of(context).maximizeyourprofitability,
        calculationIcon: AssetsData.costIcon,
        calculationName: S.of(context).productionCost,
        calculationDescription: S.of(context).productionCostDesc,
      ),
      CustomCalculator(
        onPressed: () {
          GoRouter.of(context)
              .push(AppRoutes.kSingleSprayerPesticideMixerCalculator);
        },
        fontSize: 15,
        dataName1: S.of(context).target,
        dataName2: S.of(context).tankVolume,
        dataName3: S.of(context).areaSize,
        purposeOfCalculation: S.of(context).preciseAndSafeSpraying,
        calculationIcon: AssetsData.tubeIcon,
        calculationName: S.of(context).pesticideMixer,
        calculationDescription: S.of(context).pesticideMixerDesc,
      ),
      CustomCalculator(
        onPressed: () {
          GoRouter.of(context).push(AppRoutes.kSeedQuantityCalculator);
        },
        fontSize: 15,
        dataName1: S.of(context).crop,
        dataName2: S.of(context).landArea,
        dataName3: S.of(context).germination,
        purposeOfCalculation: S.of(context).planAccurateSeeding,
        calculationIcon: AssetsData.sustainabilityIcon,
        calculationName: S.of(context).seedQuantity,
        calculationDescription: S.of(context).seedQuantityDesc,
      ),
      CustomCalculator(
        onPressed: () {
          GoRouter.of(context).push(AppRoutes.kIrrigationRateCalculator);
        },
        fontSize: 13,
        dataName1: S.of(context).soil,
        dataName2: S.of(context).weather,
        dataName3: S.of(context).crop,
        purposeOfCalculation: S.of(context).essentialForEfficientWaterUsage,
        calculationIcon: AssetsData.waterIcon,
        calculationName: S.of(context).irrigationRate,
        calculationDescription: S.of(context).irrigationRateDesc,
      ),
      // Add more CustomCalculator instances as needed
    ];

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          WelcomeMessageAndProfileSetting(),
          SizedBox(
            height: 110.h,
          ),
          const WeatherCard(),
          SizedBox(
            height: 70.h,
          ),
          Divider(
            color: kPrimaryColor,
            thickness: 2,
            height: 20.h,
            indent: 10.w,
            endIndent: 10.w,
          ),
          SizedBox(
            height: 40.h,
          ),
          SizedBox(
            height: 310.h,
            child: InfiniteCarousel.builder(
              itemCount: calculatorsList(context).length,
              itemExtent: 420.w, // Specify the width of each item
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index, realIndex) {
                final item = calculatorsList(
                    context)[index % calculatorsList(context).length];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: calculatorsList(context)[index],
                );
              },
            ),
          ),
          SizedBox(
            height: 80.h,
          ),
        ],
      ),
    );
  }
}

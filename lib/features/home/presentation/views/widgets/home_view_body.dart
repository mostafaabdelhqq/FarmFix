import 'package:farmfix/constants.dart';
import 'package:farmfix/core/utils/app_routes.dart';
import 'package:farmfix/core/utils/assets_data.dart';
import 'package:farmfix/features/home/presentation/views/widgets/custom_calculator.dart';
import 'package:farmfix/features/home/presentation/views/widgets/weather_card.dart';
import 'package:farmfix/features/home/presentation/views/widgets/welcome_message_and_profile_setting.dart';
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
        dataName1: 'Row Spacing',
        dataName2: 'Plant Spacing',
        dataName3: 'Land Area',
        purposeOfCalculation: 'Achieve ideal crop covarage',
        calculationIcon: AssetsData.grassIcon,
        calculationName: 'Plant Density',
        calculationDescription:
            'Calculate the number of plants suitable \n for your land area and spacing',
      ),
      CustomCalculator(
        onPressed: () {},
        fontSize: 15,
        dataName1: 'Seeds',
        dataName2: 'Fertilizers',
        dataName3: 'Labor',
        purposeOfCalculation: 'Maximize your profitability',
        calculationIcon: AssetsData.costIcon,
        calculationName: 'Production Cost',
        calculationDescription:
            'Estimate total farming costs and\n expected profit margin',
      ),
      CustomCalculator(
        onPressed: () {},
        fontSize: 15,
        dataName1: 'Target',
        dataName2: 'Tank Volume',
        dataName3: 'Area Size',
        purposeOfCalculation: 'Precise and safe spraying',
        calculationIcon: AssetsData.tubeIcon,
        calculationName: 'Pesticide Mixer',
        calculationDescription:
            'Determine the correct amount of\n pesticide per area and concentration',
      ),
      CustomCalculator(
        onPressed: () {},
        fontSize: 15,
        dataName1: 'Crop',
        dataName2: 'Land Area',
        dataName3: 'Germination',
        purposeOfCalculation: 'Plan accurate seeding',
        calculationIcon: AssetsData.sustainabilityIcon,
        calculationName: 'Seed Quantity',
        calculationDescription:
            'Calculate required seed amount based\n on area and germination rate',
      ),
      CustomCalculator(
        onPressed: () {},
        fontSize: 13,
        dataName1: 'Soil',
        dataName2: 'Weather',
        dataName3: 'Crop',
        purposeOfCalculation: 'Essential for efficient water usage',
        calculationIcon: AssetsData.waterIcon,
        calculationName: 'Irrigation Rate',
        calculationDescription:
            'Calculate the optimal amount of water\n based on soil type, crop, and weather',
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

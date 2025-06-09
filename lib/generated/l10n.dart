// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome`
  String get welcome {
    return Intl.message('Welcome', name: 'welcome', desc: '', args: []);
  }

  /// `Precipitation`
  String get precipitation {
    return Intl.message(
      'Precipitation',
      name: 'precipitation',
      desc: '',
      args: [],
    );
  }

  /// `Wind`
  String get wind {
    return Intl.message('Wind', name: 'wind', desc: '', args: []);
  }

  /// `Humidity`
  String get humidity {
    return Intl.message('Humidity', name: 'humidity', desc: '', args: []);
  }

  /// `Plant Density`
  String get plantDensity {
    return Intl.message(
      'Plant Density',
      name: 'plantDensity',
      desc: '',
      args: [],
    );
  }

  /// `Calculate the number of plants suitable \n For your land area and spacing`
  String get plantDensityDesc {
    return Intl.message(
      'Calculate the number of plants suitable \n For your land area and spacing',
      name: 'plantDensityDesc',
      desc: '',
      args: [],
    );
  }

  /// `Achieve ideal crop coverage`
  String get idealCropCoverage {
    return Intl.message(
      'Achieve ideal crop coverage',
      name: 'idealCropCoverage',
      desc: '',
      args: [],
    );
  }

  /// `Calculate Now`
  String get calculateNow {
    return Intl.message(
      'Calculate Now',
      name: 'calculateNow',
      desc: '',
      args: [],
    );
  }

  /// `Row Spacing`
  String get rowSpacing {
    return Intl.message('Row Spacing', name: 'rowSpacing', desc: '', args: []);
  }

  /// `Plant Spacing`
  String get plantSpacing {
    return Intl.message(
      'Plant Spacing',
      name: 'plantSpacing',
      desc: '',
      args: [],
    );
  }

  /// `Land Area`
  String get landArea {
    return Intl.message('Land Area', name: 'landArea', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `General`
  String get general {
    return Intl.message('General', name: 'general', desc: '', args: []);
  }

  /// `Account Information`
  String get accountInfo {
    return Intl.message(
      'Account Information',
      name: 'accountInfo',
      desc: '',
      args: [],
    );
  }

  /// `Appearance`
  String get appearance {
    return Intl.message('Appearance', name: 'appearance', desc: '', args: []);
  }

  /// `About`
  String get about {
    return Intl.message('About', name: 'about', desc: '', args: []);
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Log Out`
  String get logout {
    return Intl.message('Log Out', name: 'logout', desc: '', args: []);
  }

  /// `Get Result`
  String get getResult {
    return Intl.message('Get Result', name: 'getResult', desc: '', args: []);
  }

  /// `Production Cost`
  String get productionCost {
    return Intl.message(
      'Production Cost',
      name: 'productionCost',
      desc: '',
      args: [],
    );
  }

  /// `Estimate total farming costs and\n expected profit margin`
  String get productionCostDesc {
    return Intl.message(
      'Estimate total farming costs and\n expected profit margin',
      name: 'productionCostDesc',
      desc: '',
      args: [],
    );
  }

  /// `Maximize your profitability`
  String get maximizeyourprofitability {
    return Intl.message(
      'Maximize your profitability',
      name: 'maximizeyourprofitability',
      desc: '',
      args: [],
    );
  }

  /// `Seeds`
  String get seeds {
    return Intl.message('Seeds', name: 'seeds', desc: '', args: []);
  }

  /// `Fertilizers`
  String get fertilizers {
    return Intl.message('Fertilizers', name: 'fertilizers', desc: '', args: []);
  }

  /// `Labor`
  String get labor {
    return Intl.message('Labor', name: 'labor', desc: '', args: []);
  }

  /// `Seed Cost`
  String get seedCost {
    return Intl.message('Seed Cost', name: 'seedCost', desc: '', args: []);
  }

  /// `Fertilizer Cost`
  String get fertilizerCost {
    return Intl.message(
      'Fertilizer Cost',
      name: 'fertilizerCost',
      desc: '',
      args: [],
    );
  }

  /// `Labor Cost`
  String get laborCost {
    return Intl.message('Labor Cost', name: 'laborCost', desc: '', args: []);
  }

  /// `Water Cost`
  String get waterCost {
    return Intl.message('Water Cost', name: 'waterCost', desc: '', args: []);
  }

  /// `Other Expenses`
  String get otherExpenses {
    return Intl.message(
      'Other Expenses',
      name: 'otherExpenses',
      desc: '',
      args: [],
    );
  }

  /// `Total Cost`
  String get totalCost {
    return Intl.message('Total Cost', name: 'totalCost', desc: '', args: []);
  }

  /// `Per Square Meter`
  String get perSquareMeter {
    return Intl.message(
      'Per Square Meter',
      name: 'perSquareMeter',
      desc: '',
      args: [],
    );
  }

  /// `FarmFix Assistant`
  String get farmFixAssistant {
    return Intl.message(
      'FarmFix Assistant',
      name: 'farmFixAssistant',
      desc: '',
      args: [],
    );
  }

  /// ` Welcome to FarmFix Assistant! \n\n I'm here to help with all your agriculture and climate questions.`
  String get welcomeMessageChatbot {
    return Intl.message(
      ' Welcome to FarmFix Assistant! \n\n I\'m here to help with all your agriculture and climate questions.',
      name: 'welcomeMessageChatbot',
      desc: '',
      args: [],
    );
  }

  /// `Target`
  String get target {
    return Intl.message('Target', name: 'target', desc: '', args: []);
  }

  /// `Tank Volume`
  String get tankVolume {
    return Intl.message('Tank Volume', name: 'tankVolume', desc: '', args: []);
  }

  /// `Area Size`
  String get areaSize {
    return Intl.message('Area Size', name: 'areaSize', desc: '', args: []);
  }

  /// `Precise and safe spraying`
  String get preciseAndSafeSpraying {
    return Intl.message(
      'Precise and safe spraying',
      name: 'preciseAndSafeSpraying',
      desc: '',
      args: [],
    );
  }

  /// `Pesticide Mixer`
  String get pesticideMixer {
    return Intl.message(
      'Pesticide Mixer',
      name: 'pesticideMixer',
      desc: '',
      args: [],
    );
  }

  /// `Determine the correct amount of\n pesticide per area and concentration`
  String get pesticideMixerDesc {
    return Intl.message(
      'Determine the correct amount of\n pesticide per area and concentration',
      name: 'pesticideMixerDesc',
      desc: '',
      args: [],
    );
  }

  /// `Crop`
  String get crop {
    return Intl.message('Crop', name: 'crop', desc: '', args: []);
  }

  /// `Germination`
  String get germination {
    return Intl.message('Germination', name: 'germination', desc: '', args: []);
  }

  /// `Plan accurate seeding`
  String get planAccurateSeeding {
    return Intl.message(
      'Plan accurate seeding',
      name: 'planAccurateSeeding',
      desc: '',
      args: [],
    );
  }

  /// `Seed Quantity`
  String get seedQuantity {
    return Intl.message(
      'Seed Quantity',
      name: 'seedQuantity',
      desc: '',
      args: [],
    );
  }

  /// `Calculate required seed amount based\n on area and germination rate`
  String get seedQuantityDesc {
    return Intl.message(
      'Calculate required seed amount based\n on area and germination rate',
      name: 'seedQuantityDesc',
      desc: '',
      args: [],
    );
  }

  /// `Soil`
  String get soil {
    return Intl.message('Soil', name: 'soil', desc: '', args: []);
  }

  /// `Weather`
  String get weather {
    return Intl.message('Weather', name: 'weather', desc: '', args: []);
  }

  /// `Essential for efficient water usage`
  String get essentialForEfficientWaterUsage {
    return Intl.message(
      'Essential for efficient water usage',
      name: 'essentialForEfficientWaterUsage',
      desc: '',
      args: [],
    );
  }

  /// `Irrigation Rate`
  String get irrigationRate {
    return Intl.message(
      'Irrigation Rate',
      name: 'irrigationRate',
      desc: '',
      args: [],
    );
  }

  /// `Calculate the optimal amount of water\n based on soil type, crop, and weather`
  String get irrigationRateDesc {
    return Intl.message(
      'Calculate the optimal amount of water\n based on soil type, crop, and weather',
      name: 'irrigationRateDesc',
      desc: '',
      args: [],
    );
  }

  /// `Crop Type Kc`
  String get cropTypeKc {
    return Intl.message('Crop Type Kc', name: 'cropTypeKc', desc: '', args: []);
  }

  /// `Weather Condition`
  String get weatherCondition {
    return Intl.message(
      'Weather Condition',
      name: 'weatherCondition',
      desc: '',
      args: [],
    );
  }

  /// `Wheat`
  String get wheat {
    return Intl.message('Wheat', name: 'wheat', desc: '', args: []);
  }

  /// `Corn`
  String get corn {
    return Intl.message('Corn', name: 'corn', desc: '', args: []);
  }

  /// `Rice`
  String get rice {
    return Intl.message('Rice', name: 'rice', desc: '', args: []);
  }

  /// `Cotton`
  String get cotton {
    return Intl.message('Cotton', name: 'cotton', desc: '', args: []);
  }

  /// `Sunflower`
  String get sunflower {
    return Intl.message('Sunflower', name: 'sunflower', desc: '', args: []);
  }

  /// `Citrus`
  String get citrus {
    return Intl.message('Citrus', name: 'citrus', desc: '', args: []);
  }

  /// `Tomato`
  String get tomato {
    return Intl.message('Tomato', name: 'tomato', desc: '', args: []);
  }

  /// `Potato`
  String get potato {
    return Intl.message('Potato', name: 'potato', desc: '', args: []);
  }

  /// `Alfalfa`
  String get alfalfa {
    return Intl.message('Alfalfa', name: 'alfalfa', desc: '', args: []);
  }

  /// `Grapes`
  String get grapes {
    return Intl.message('Grapes', name: 'grapes', desc: '', args: []);
  }

  /// `Beans`
  String get beans {
    return Intl.message('Beans', name: 'beans', desc: '', args: []);
  }

  /// `Green Beans`
  String get greenBeans {
    return Intl.message('Green Beans', name: 'greenBeans', desc: '', args: []);
  }

  /// `Pepper`
  String get pepper {
    return Intl.message('Pepper', name: 'pepper', desc: '', args: []);
  }

  /// `Zucchini`
  String get zucchini {
    return Intl.message('Zucchini', name: 'zucchini', desc: '', args: []);
  }

  /// `Watermelon`
  String get watermelon {
    return Intl.message('Watermelon', name: 'watermelon', desc: '', args: []);
  }

  /// `Windy`
  String get windy {
    return Intl.message('Windy', name: 'windy', desc: '', args: []);
  }

  /// `Rainy`
  String get rainy {
    return Intl.message('Rainy', name: 'rainy', desc: '', args: []);
  }

  /// `Mild`
  String get mild {
    return Intl.message('Mild', name: 'mild', desc: '', args: []);
  }

  /// `Cool and Humid`
  String get coolAndHumid {
    return Intl.message(
      'Cool and Humid',
      name: 'coolAndHumid',
      desc: '',
      args: [],
    );
  }

  /// `Hot and Dry`
  String get hotAndDry {
    return Intl.message('Hot and Dry', name: 'hotAndDry', desc: '', args: []);
  }

  /// `Hot and Humid`
  String get hotAndHumid {
    return Intl.message(
      'Hot and Humid',
      name: 'hotAndHumid',
      desc: '',
      args: [],
    );
  }

  /// `Cool and Dry`
  String get coolAndDry {
    return Intl.message('Cool and Dry', name: 'coolAndDry', desc: '', args: []);
  }

  /// `Very Hot and Dry`
  String get veryHotAndDry {
    return Intl.message(
      'Very Hot and Dry',
      name: 'veryHotAndDry',
      desc: '',
      args: [],
    );
  }

  /// `Seed Weight`
  String get seedWeight {
    return Intl.message('Seed Weight', name: 'seedWeight', desc: '', args: []);
  }

  /// `Crop Type`
  String get cropType {
    return Intl.message('Crop Type', name: 'cropType', desc: '', args: []);
  }

  /// `Single Sprayer`
  String get singleSprayer {
    return Intl.message(
      'Single Sprayer',
      name: 'singleSprayer',
      desc: '',
      args: [],
    );
  }

  /// `Multiple Sprayers`
  String get multipleSprayers {
    return Intl.message(
      'Multiple Sprayers',
      name: 'multipleSprayers',
      desc: '',
      args: [],
    );
  }

  /// `Sprayer Volume`
  String get sprayerVolume {
    return Intl.message(
      'Sprayer Volume',
      name: 'sprayerVolume',
      desc: '',
      args: [],
    );
  }

  /// `Target Concentration`
  String get targetConcentration {
    return Intl.message(
      'Target Concentration',
      name: 'targetConcentration',
      desc: '',
      args: [],
    );
  }

  /// `Sprayer Coverage Area`
  String get sprayerCovarageArea {
    return Intl.message(
      'Sprayer Coverage Area',
      name: 'sprayerCovarageArea',
      desc: '',
      args: [],
    );
  }

  /// `Num of Sprayers`
  String get numOfSprayers {
    return Intl.message(
      'Num of Sprayers',
      name: 'numOfSprayers',
      desc: '',
      args: [],
    );
  }

  /// `Discover Diseases`
  String get discoverDiseases {
    return Intl.message(
      'Discover Diseases',
      name: 'discoverDiseases',
      desc: '',
      args: [],
    );
  }

  /// `Prediction Result`
  String get predictionResult {
    return Intl.message(
      'Prediction Result',
      name: 'predictionResult',
      desc: '',
      args: [],
    );
  }

  /// `Accuracy`
  String get accuracy {
    return Intl.message('Accuracy', name: 'accuracy', desc: '', args: []);
  }

  /// `is a metric used to evaluate model performance. It indicates the percentage of correct predictions out of all predictions made. In simple terms, higher accuracy means the model is generally making more correct decisions.`
  String get accuracyDesc {
    return Intl.message(
      'is a metric used to evaluate model performance. It indicates the percentage of correct predictions out of all predictions made. In simple terms, higher accuracy means the model is generally making more correct decisions.',
      name: 'accuracyDesc',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

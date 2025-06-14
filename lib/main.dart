import 'package:farmfix/farm_fix.dart';
import 'package:farmfix/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../localization_cubit/cubit/locale_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(BlocProvider<LocaleCubit>(
    create: (_) => LocaleCubit(),
    child: FarmFix(isLoggedIn: isLoggedIn),
  ));
}

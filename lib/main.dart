import 'package:farmfix/farm_fix.dart';
import 'package:farmfix/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../localization_cubit/cubit/locale_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(BlocProvider<LocaleCubit>(
    create: (_) => LocaleCubit(),
    child: const FarmFix(),
  ));
}

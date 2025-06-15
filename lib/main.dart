import 'package:farmfix/farm_fix.dart';
import 'package:farmfix/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/landscanner/logic/cubit/soilgrids_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => SoilGridsCubit()),
          ],
       child: const FarmFix(),));
}

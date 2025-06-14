import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleState(const Locale('en')));

  void switchToArabic() {
    emit(LocaleState(const Locale('ar')));
  }

  void switchToEnglish() {
    emit(LocaleState(const Locale('en')));
  }

  void setLocale(Locale locale) {
    emit(LocaleState(locale));
  }
}

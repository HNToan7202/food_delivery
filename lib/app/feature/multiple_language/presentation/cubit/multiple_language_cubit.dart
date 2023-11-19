import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'multiple_language_state.dart';

class MultipleLanguageCubit extends Cubit<MultipleLanguageState>
    with HydratedMixin {
  String get currentLanguage => state.locale.languageCode;
  MultipleLanguageCubit()
      : super(const MultipleLanguageInitial(locale: Locale("vi", "")));

  void changeLanguage(String code) {
    emit(state.copyWith(locale: Locale(code, "")));
  }

  @override
  MultipleLanguageState? fromJson(Map<String, dynamic> json) {
    return MultipleLanguageState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(MultipleLanguageState state) {
    return state.toMap();
  }
}

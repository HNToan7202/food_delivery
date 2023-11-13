part of 'multiple_language_cubit.dart';

@immutable
class MultipleLanguageState {
  final Locale locale;
  const MultipleLanguageState({this.locale = const Locale("vi", "")});
  MultipleLanguageState copyWith({Locale? locale}) {
    return MultipleLanguageState(locale: locale ?? this.locale);
  }

  Map<String, dynamic> toMap() {
    return {
      'code': locale.languageCode,
    };
  }

  factory MultipleLanguageState.fromMap(Map<String, dynamic> map) {
    return MultipleLanguageState(
      locale: Locale(map['code'], ""),
    );
  }
  String toJson() => json.encode(toMap());

  factory MultipleLanguageState.fromJson(String source) =>
      MultipleLanguageState.fromMap(json.decode(source));
}

class MultipleLanguageInitial extends MultipleLanguageState {
  const MultipleLanguageInitial({required super.locale});
}

class MultipleLanguageChangeLanguage extends MultipleLanguageState {
  const MultipleLanguageChangeLanguage({required super.locale});
}

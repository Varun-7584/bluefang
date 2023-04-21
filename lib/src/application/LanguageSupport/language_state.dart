part of 'language_bloc.dart';

abstract class LanguageState extends Equatable {
  final String language;
  const LanguageState({required this.language});

  @override
  List<Object> get props => [language];
}

class LanguageInitial extends LanguageState {
  const LanguageInitial() : super(language: 'en');
}

class LanguageChanged extends LanguageState {
  // ignore: annotate_overrides, overridden_fields
  final String language;

  LanguageChanged({required this.language}) : super(language: language) {
    //log("New language: $language", name: "language_state");
  }

  Map<String, String> toMap() {
    return {'language': language};
  }
}

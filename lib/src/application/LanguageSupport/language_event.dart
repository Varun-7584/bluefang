part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class ChangeLanguage extends LanguageEvent {
  final String language;

  ChangeLanguage(this.language){
    //log("ChangeLanguage event created. $language", name: "language_event");
  }
}

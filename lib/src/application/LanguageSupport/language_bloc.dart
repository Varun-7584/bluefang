import 'package:bluefang/l10n/l10n.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends HydratedBloc<LanguageEvent, LanguageState> {
  @override
  LanguageBloc() : super(const LanguageInitial()) {
    on<ChangeLanguage>((event, emit) async {
      //log("New language: ${event.language}");
      final String languageCode = L10n.getCode(event.language);
      //log("Language code: $languageCode", name: "language_bloc");
      final newLang = languageCode;
      emit(LanguageChanged(language: newLang));
    });
  }

  @override
  LanguageState? fromJson(Map<String, dynamic> json) {
    return LanguageChanged(language: (json['language'] as String?) ?? L10n.getCode("🇺🇸 English"));
  }

  @override
  Map<String, dynamic>? toJson(LanguageState state) {
    return {'language': state.language};
  }
}

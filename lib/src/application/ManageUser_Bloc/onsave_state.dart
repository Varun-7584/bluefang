abstract class OnSaveState {}

class OnSaveInitial extends OnSaveState {}

class OnSaveSaving extends OnSaveState {}

class OnSaveSaved extends OnSaveState {
  String status;
  String value;
  OnSaveSaved(
    this.status,
    this.value,
  );
}

class OnSaveLoadingState extends OnSaveState {}

class ReloadListState extends OnSaveState {}

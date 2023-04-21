import 'package:bloc/bloc.dart';
import '../../domain/user/invite_users.dart';
import '../../infrastructure/manageuser/firebase_manageuser_repository.dart';
import 'onsave_event.dart';
import 'onsave_state.dart';

class OnSaveBloc extends Bloc<OnSaveEvent, OnSaveState> {
  OnSaveBloc() : super(OnSaveInitial()) {
    on<SaveButtonPressedEvent>((event, emit) async {
      emit(OnSaveLoadingState());
      final firebaseRepo = ManageUserRepository(user: ManageUser());
      firebaseRepo.UpdateUsers(event.isActive, event.role, event.docId)
          .then((value) {
        String status = 'success';
        if (value.contains('error')) {
          status = 'error';
        }
        emit(OnSaveSaved(status, value));
        emit(ReloadListState());
      });
    });
  }
}

import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../domain/user/invite_users.dart';
import '../../infrastructure/manageuser/firebase_manageuser_repository.dart';
import 'manage_user_event.dart';
import 'manage_user_state.dart';

class ManageUserBloc extends Bloc<ManageUserEvent, ManageUserState> {
  StreamSubscription? _subscription;
  ManageUserBloc() : super(ManageUserLoadingState()) {
    on<LoadUsersEvent>((event, emit) async {
      emit(ManageUserLoadingState());
      final firebaseRepo = ManageUserRepository(user: ManageUser());
      final result = await firebaseRepo.GetApprovedUsers();
      final invitedUsers = await firebaseRepo.GetInvitedUsers();
      if (result != null) {
        emit(ManageUserSuccessState(
          activeUsers: result["_activeUsers"] as List<Map<String, dynamic>>,
          inactiveUsers: result["_inActiveUsers"] as List<Map<String, dynamic>>,
          invitedUsers: invitedUsers,
        ));
        _subscription =
            firebaseRepo.GetApprovedUsers().asStream().listen((updatedUsers) {
          emit(ManageUserSuccessState(
            activeUsers:
                updatedUsers["_activeUsers"] as List<Map<String, dynamic>>,
            inactiveUsers:
                updatedUsers["_inActiveUsers"] as List<Map<String, dynamic>>,
            invitedUsers: invitedUsers,
          ));
        });
      } else {
        emit(ManageUserLoadingState());
      }
    });

    on<ReloadListEvent>((event, emit) async {
      final firebaseRepo = ManageUserRepository(user: ManageUser());
      final updatedUsers = await firebaseRepo.GetApprovedUsers();
      final invitedUsers = await firebaseRepo.GetInvitedUsers();
      if (updatedUsers != null) {
        emit(ManageUserSuccessState(
          activeUsers:
              updatedUsers["_activeUsers"] as List<Map<String, dynamic>>,
          inactiveUsers:
              updatedUsers["_inActiveUsers"] as List<Map<String, dynamic>>,
          invitedUsers: invitedUsers,
        ));
      } else {
        emit(ManageUserLoadingState());
      }
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

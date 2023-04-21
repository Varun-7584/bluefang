

import 'package:bloc/bloc.dart';
import '../../domain/user/invite_users.dart';
import '../../infrastructure/manageuser/firebase_manageuser_repository.dart';
import 'invite_user_state.dart';

class InviteUserCubit extends Cubit<InviteUserState> {
  InviteUserCubit() : super(InviteUserInitial());

  void inviteUser(ManageUser user) async {
    final firebaseRepo = ManageUserRepository(user: ManageUser(invitecode: user.invitecode,phonenumber: user.phonenumber, role: user.role));
    await firebaseRepo.InviteUser().then((value) {
      if (value == null) {
        emit(InviteUserNavigate());
      } else {
        emit(InviteUserFail(value));
      }
    });
    // implement the Firebase reset password feature here
  }
}
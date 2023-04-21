abstract class InviteUserState {}

class InviteUserInitial extends InviteUserState {}

class InviteUserSuccess extends InviteUserState {}
class InviteUserNavigate extends InviteUserState {}
class InviteUserFail extends InviteUserState {
  InviteUserFail(this.errorMsg);
  final String? errorMsg;
}
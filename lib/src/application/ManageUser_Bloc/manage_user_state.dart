abstract class ManageUserState {}

class ManageUserLoadingState extends ManageUserState {}

class ManageUserSuccessState extends ManageUserState {
  List<Map<String, dynamic>> activeUsers;
  List<Map<String, dynamic>> inactiveUsers;
  List<Map<String, dynamic>> invitedUsers;

  ManageUserSuccessState({
    required this.activeUsers,
    required this.inactiveUsers,
    required this.invitedUsers,
  });
}

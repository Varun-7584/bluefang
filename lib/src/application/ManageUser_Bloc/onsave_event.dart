abstract class OnSaveEvent {}

class SaveButtonPressedEvent extends OnSaveEvent {
  final String isActive;
  final String role;
  final String docId;
  SaveButtonPressedEvent(
      {required this.isActive, required this.role, required this.docId});
}

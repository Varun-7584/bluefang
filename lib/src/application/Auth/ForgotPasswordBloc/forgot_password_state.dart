

abstract class ForgotPasswordState {}

class ForgotPasswordInitial extends ForgotPasswordState {}

class ForgotPasswordSuccess extends ForgotPasswordState {}
class ForgotPasswordNavigate extends ForgotPasswordState {}
class ForgotPasswordFail extends ForgotPasswordState {
  ForgotPasswordFail(this.errorMsg);
  final String? errorMsg;
}
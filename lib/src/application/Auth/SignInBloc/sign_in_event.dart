abstract class SignInEvent {}

class SignInWithEmail extends SignInEvent {
  final String email;
  final String password;
  SignInWithEmail({required this.email, required this.password});
}

class SignoutWithEmail extends SignInEvent {}

class NavigateToPhoneVerificationEvent extends SignInEvent {}

class SignInFailureEvent extends SignInEvent {}


abstract class PhoneVerificationState {}

class PhoneVerificationInitial extends PhoneVerificationState {}

class PhoneVerificationSuccess extends PhoneVerificationState {}

class PhoneVerificationLoadingState extends PhoneVerificationState {}

class NavigateToOtpVerificationState extends PhoneVerificationState {}

class PhoneVerificationFailureState extends PhoneVerificationState {

  PhoneVerificationFailureState(this.errorMsg);
  final String? errorMsg;
}

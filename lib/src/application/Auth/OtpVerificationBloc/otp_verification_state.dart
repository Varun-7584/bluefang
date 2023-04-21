
abstract class OtpVerificationState {}

class OtpVerificationInitial extends OtpVerificationState {}

class OtpVerificationSuccess extends OtpVerificationState {}

class NavigateToFleetManagerState extends OtpVerificationState {}

class OtpVerificationFailureState extends OtpVerificationState {

  OtpVerificationFailureState(this.errorMsg);
  final String? errorMsg;
}

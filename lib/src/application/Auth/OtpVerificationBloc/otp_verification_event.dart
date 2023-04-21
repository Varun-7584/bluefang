abstract class OtpVerificationEvent {}

class OtpVerificationWithNumber extends OtpVerificationEvent {
  final String otp;
  OtpVerificationWithNumber({ required this.otp,});
}

class NavigateToOtpVerificationEvent extends OtpVerificationEvent {}

class OtpVerificationFailureEvent extends OtpVerificationEvent {}

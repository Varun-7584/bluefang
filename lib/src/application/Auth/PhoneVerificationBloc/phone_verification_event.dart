abstract class PhoneVerificationEvent {}

class PhoneVerificationWithNumber extends PhoneVerificationEvent {
  final String phonenumber;
  PhoneVerificationWithNumber({ required this.phonenumber,});
}

class NavigateToOtpVerificationEvent extends PhoneVerificationEvent {}

class PhoneVerificationFailureEvent extends PhoneVerificationEvent {}

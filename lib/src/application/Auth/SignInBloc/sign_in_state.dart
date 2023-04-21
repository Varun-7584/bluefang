import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInSuccess extends SignInState {}

class NavigateToPhoneVerificationState extends SignInState {}

class NavigateToFleetManagerState extends SignInState {}


class SignInFailureState extends SignInState {

  SignInFailureState(this.errorMsg);
  final String? errorMsg;
}

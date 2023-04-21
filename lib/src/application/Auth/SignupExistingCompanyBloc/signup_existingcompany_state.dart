import 'package:firebase_auth/firebase_auth.dart';

abstract class SignupExistingCompanyState {}

class ExistingCompanySignupInitial extends SignupExistingCompanyState {}

class ExistingCompanySignupSuccess extends SignupExistingCompanyState {}

class NavigateToSignInState extends SignupExistingCompanyState {}

class ExistingCompanySignupFailure extends SignupExistingCompanyState {
  ExistingCompanySignupFailure(this.errorMsg);

  final String? errorMsg;

}

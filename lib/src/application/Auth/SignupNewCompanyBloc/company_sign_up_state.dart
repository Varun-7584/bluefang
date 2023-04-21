import 'package:firebase_auth/firebase_auth.dart';

abstract class CompanySignUpState {}

class CompanySignUpInitial extends CompanySignUpState {}

class SignUpSuccess extends CompanySignUpState {}

class NavigateToSignUpPageState extends CompanySignUpState {}

class CompanySignUpFailure extends CompanySignUpState {
  CompanySignUpFailure(this.errorMsg);
  final String? errorMsg;
}

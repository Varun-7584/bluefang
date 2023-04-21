abstract class SignupExistingCompanyEvent {}

class CreateNewCompanyUser extends SignupExistingCompanyEvent {
  final String firstname;
  final String phonenumber;
  final String jobtitle;
  final String email;
  final String password;
  final String invitecode;
  CreateNewCompanyUser({
    required this.firstname,
    required this.phonenumber,
    required this.jobtitle,
    required this.email,
    required this.password,
    required this.invitecode
  });
}

class SignoutWithEmail extends SignupExistingCompanyEvent {}

class NavigateToSigninEvent extends SignupExistingCompanyEvent {}

class SignupExistingCompanyFailureEvent extends SignupExistingCompanyEvent {}

abstract class CompanySignUpEvent {}

class SignUpWithCompany extends CompanySignUpEvent {
  final String? uid;
  final String companyname;
  final String email;
  final String password;
  final String firstname;
  final String lastname;
  final String phonenumber;
  final String jobtitle;
  final String address;
  final String role;

  SignUpWithCompany({
    required this.uid,
    required this.email,
    required this.password,
    required this.companyname,
    required this.firstname,
    required this.lastname,
    required this.phonenumber,
    required this.address,
    required this.jobtitle,
    required this.role

  });
}

class NavigateToSignUpPageEvent extends CompanySignUpEvent {}

class SignUpFailureEvent extends CompanySignUpEvent {}

import 'package:bloc/bloc.dart';
import '../../../domain/user/user.dart';
import '../../../infrastructure/auth/firebase_repository.dart';
import 'company_sign_up_event.dart';
import 'company_sign_up_state.dart';

class SignupNewCompanyBloc
    extends Bloc<CompanySignUpEvent, CompanySignUpState> {
  SignupNewCompanyBloc() : super(CompanySignUpInitial()) {
    on<SignUpWithCompany>((event, emit) async {
      final firebaseRepo = new FirebaseRepository(
          user: new Users(
              uid: null,
              companyname: event.companyname,
              firstname: event.firstname,
              lastname: event.lastname,
              phonenumber: event.phonenumber,
              address: event.address,
              jobtitle: event.jobtitle,
              email: event.email,
              password: event.password,
              role: event.role));

      await firebaseRepo.createUserWithEmailAndPassword().then((value) {
        if (value == null) {
          emit(NavigateToSignUpPageState());
        } else {
          emit(CompanySignUpFailure(value));
        }
      });
    });
  }
}

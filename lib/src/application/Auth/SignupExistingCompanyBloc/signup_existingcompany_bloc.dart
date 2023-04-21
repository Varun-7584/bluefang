import 'package:bluefang/src/application/Auth/SignupExistingCompanyBloc/signup_existingcompany_event.dart';
import 'package:bluefang/src/application/Auth/SignupExistingCompanyBloc/signup_existingcompany_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bluefang/src/domain/user/user.dart';
import '../../../infrastructure/auth/firebase_repository.dart';

class SignupExistingCompanyBloc extends Bloc<SignupExistingCompanyEvent, SignupExistingCompanyState> {
  SignupExistingCompanyBloc() : super(ExistingCompanySignupInitial()) {
    on<CreateNewCompanyUser>((event, emit) async {
      final firebaseRepo = FirebaseRepository(
          user: Users(
            uid: null,
            firstname: event.firstname,
            phonenumber: event.phonenumber,
            jobtitle: event.jobtitle,
            email: event.email,
            password: event.password,
            invitecode: event.invitecode,
          ));

      final status = await firebaseRepo.createUserWithEmailAndPassword().then((value) {
        if (value == null) {
          emit(NavigateToSignInState());
        } else {
          emit(ExistingCompanySignupFailure(value));
        }
      });
    });
  }
}

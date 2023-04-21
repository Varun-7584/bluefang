import 'package:bloc/bloc.dart';

import '../../../domain/user/user.dart';
import '../../../infrastructure/auth/firebase_repository.dart';
import 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(ForgotPasswordInitial());

  void resetPassword(String email) async {
    final firebaseRepo = FirebaseRepository(user: Users(email: email));
    await firebaseRepo.resetPassword().then((value) {
      if (value == null) {
        emit(ForgotPasswordNavigate());
      } else {
        emit(ForgotPasswordFail(value));
      }
    });
    // implement the Firebase reset password feature here
  }
}

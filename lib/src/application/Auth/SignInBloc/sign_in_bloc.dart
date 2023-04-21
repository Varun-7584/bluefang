import 'package:bluefang/src/application/Auth/SignInBloc/sign_in_event.dart';
import 'package:bluefang/src/application/Auth/SignInBloc/sign_in_state.dart';
import 'package:bluefang/src/application/Auth/SignInBloc/sign_in_event.dart';
import 'package:bluefang/src/application/Auth/SignInBloc/sign_in_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bluefang/src/domain/user/user.dart';
import '../../../infrastructure/auth/firebase_repository.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInWithEmail>((event, emit) async {
      final firebaseRepo = FirebaseRepository(
          user: Users(
        email: event.email,
        password: event.password,
      ));

      final status = await firebaseRepo.loginWithEmailAndPassword();
      if (status == null) {
        final isVerified = await firebaseRepo.isUserDeviceVerified();
        if (isVerified) {
          emit(NavigateToFleetManagerState());
        } else {
          emit(NavigateToPhoneVerificationState());
        }
      } else {
        emit(SignInFailureState(status));
      }
    });
  }
}

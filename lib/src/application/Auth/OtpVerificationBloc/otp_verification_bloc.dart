
import 'package:bloc/bloc.dart';

import '../../../infrastructure/auth/firebase_repository.dart';
import 'otp_verification_event.dart';
import 'otp_verification_state.dart';

class OtpVerificationBloc extends Bloc<OtpVerificationEvent, OtpVerificationState> {
  OtpVerificationBloc() : super(OtpVerificationInitial())  {
    on<OtpVerificationWithNumber>((event, emit) async {
      try {
        final firebaseRepo = FirebaseRepository();
        final status =
        await firebaseRepo.verifyOTP(event.otp).then((value) {
          if (value == true) {
            emit(NavigateToFleetManagerState());
          } else if (value == false){
            emit(OtpVerificationFailureState("Invalid otp"));
          }
        });
      } catch (e) {
        emit(OtpVerificationFailureState(e.toString()));
      }
    });

  }
}

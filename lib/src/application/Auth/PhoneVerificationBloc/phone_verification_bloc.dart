import 'package:bluefang/src/application/Auth/PhoneVerificationBloc/phone_verification_event.dart';
import 'package:bluefang/src/application/Auth/PhoneVerificationBloc/phone_verification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../infrastructure/auth/firebase_repository.dart';

class PhoneVerificationBloc
    extends Bloc<PhoneVerificationEvent, PhoneVerificationState> {
  PhoneVerificationBloc() : super(PhoneVerificationInitial()) {
    on<PhoneVerificationWithNumber>((event, emit) async {
      try {
        emit(PhoneVerificationLoadingState());
        final firebaseRepo = FirebaseRepository();
        final status = await firebaseRepo
            .phoneMultiFactorAuth(event.phonenumber)
            .then((value) {
          if (value == null) {
            emit(NavigateToOtpVerificationState());
          } else {
            emit(PhoneVerificationFailureState(value));
          }
        });
      } catch (e) {
        emit(PhoneVerificationFailureState(e.toString()));
      }
    });
  }
}


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/business_logic/blocs/forgot_password/forgot_password_events.dart';
import 'package:news_app/src/business_logic/blocs/forgot_password/forgot_password_states.dart';
import 'package:news_app/src/services/firebase_services/auth_services.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState>{
  ForgotPasswordBloc(ForgotPasswordState initialState) : super(initialState);

  @override
  Stream<ForgotPasswordState> mapEventToState(ForgotPasswordEvent event) async*{
    if (event is ForgotPasswordResetEvent){
      yield ForgotPasswordLoadingState();
      try {
        var _response = await FirebaseAuthService.userForgotPassword(event.email);
        if (_response){
          yield ForgotPasswordSuccessState();
        } else {
          yield ForgotPasswordFailedState(message: FirebaseAuthService.errorMessage);
        }
      } catch (_){
        yield ForgotPasswordErrorState();
      }
    }
  }

}
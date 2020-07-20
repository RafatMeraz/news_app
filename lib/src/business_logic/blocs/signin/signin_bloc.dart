import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/business_logic/blocs/signin/signin_events.dart';
import 'package:news_app/src/business_logic/blocs/signin/signin_states.dart';
import 'package:news_app/src/services/firebase_services/auth_services.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>{
  final FirebaseAuthService _authService = FirebaseAuthService();
  SignInBloc(SignInState initialState) : super(initialState);

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async*{
    if (event is SignInOnUserAccount){
      yield SignInLoadingState();
      try {
        var userSignUser = await _authService.userSignIn( event.email, event.password);
        if (userSignUser){
          yield SignInSuccessState();
        } else {
          yield SignInFailedState(message: _authService.errorMessage);
        }
      } catch (_){
        yield SignInErrorState();
      }
    }
  }

}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/business_logic/blocs/signup/signup_events.dart';
import 'package:news_app/src/business_logic/blocs/signup/signup_states.dart';
import 'package:news_app/src/services/firebase_services/auth_services.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState>{
  FirebaseAuthService _authService = FirebaseAuthService();
  SignUpBloc(SignUpState initialState) : super(initialState);

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async*{
    if (event is SignUpToUserAccount){
      yield SignUpLoadingState();
      try {
        var createNewUser = await _authService.createNewUser( event.email, event.password);
        if (createNewUser){
          var uploadData = await _authService.uploadUserData(event.email, _authService.user.uid, event.userName);
          if (uploadData){
            yield SignUpSuccessState();
          } else {
            yield SignUpFailedState(message: _authService.errorMessage);
          }
        } else {
          yield SignUpFailedState(message: _authService.errorMessage);
        }
      } catch (e){
        yield SignUpErrorState();
      }
    }
  }

}
import 'firebase_services/auth_services.dart';

class Repository {
  FirebaseAuthService _authService = FirebaseAuthService();

  Function signUpUserAccount(String email, String password, String userName) {
    _authService.userSignUp(email, password, userName);
  }
}
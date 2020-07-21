import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/view/ui/home.dart';
import 'package:news_app/src/view/ui/signin.dart';

// firebase user data root url
const String USER_DATA = 'users';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  FirebaseUser user;
  String errorMessage;

  // check user is logged on or not
  checkUserAuthState() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return SignIn();
          }
        });
  }

  Future<bool> createNewUser(String email, password)async{
    try {
      var _authResult = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (_authResult != null){
        user = _authResult.user;
        return true;
      }
    } catch (e){
      errorMessage = e.toString();
      return false;
    }
  }

  Future<bool> uploadUserData(String email, String uid, String userName)async{
    try {
      await _firestore.collection('users').document(uid).setData({
        'uid': uid,
        'user_name': userName,
        'email': email,
        });
      return true;
    } catch (e){
      errorMessage = e.toString();
      return false;
    }
  }

  
  // Firebase sign in method
  Future<bool> userSignIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (error){
      errorMessage = error.toString();
      return false;
    }
  }

  // Firebase forgot password method
  Future<bool> userForgotPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    } catch (error){
      errorMessage = error.toString();
      return false;
    }
  }

  // sign out user
  userSignOut(){
    FirebaseAuth.instance.signOut();
  }
}
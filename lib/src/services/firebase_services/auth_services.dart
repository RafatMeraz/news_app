import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/view/ui/home.dart';
import 'package:news_app/src/view/ui/signin.dart';

// firebase user data root url
const String USER_DATA = 'users';

class FirebaseAuthService {
  
  
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

  // Firebase sign up method
  Future<bool> userSignUp(String email, String password, String userName) {
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
        .then((value){
           if (value.user != null){
             Firestore.instance.collection(USER_DATA).document(value.user.uid).setData({
               'username' : userName,
               'email' : email,
               'uid' : value.user.uid
             }).catchError((onError){
               return false;
             }).whenComplete(() {
               return true;
             });
           }
      }
    ).catchError((onError){
      return false;
    });
  }
  
  // Firebase sign in method
  Future<bool> userSignIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (error){
      return false;
    }
  }

  // Firebase forgot password method
  Future<bool> userForgotPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    } catch (error){
      return false;
    }
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/app.dart';
import 'package:news_app/src/business_logic/blocs/signin/signin_bloc.dart';
import 'package:news_app/src/business_logic/blocs/signin/signin_states.dart';
import 'package:news_app/src/business_logic/blocs/signup/signup_bloc.dart';
import 'package:news_app/src/business_logic/blocs/signup/signup_states.dart';

void main() {
  var blocProvider = MultiBlocProvider(
    providers: [
      BlocProvider<SignUpBloc>(
        create: (BuildContext context) => SignUpBloc(SignUpInitialState()),
      ),
      BlocProvider<SignInBloc>(
        create: (BuildContext context) => SignInBloc(SignInInitialState()),
      ),
    ],
    child: NewsApp(),
  );
  runApp(blocProvider);
}
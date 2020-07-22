import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/app.dart';
import 'package:news_app/src/business_logic/blocs/forgot_password/forgot_password_bloc.dart';
import 'package:news_app/src/business_logic/blocs/forgot_password/forgot_password_states.dart';
import 'package:news_app/src/business_logic/blocs/home/home_bloc.dart';
import 'package:news_app/src/business_logic/blocs/home/home_states.dart';
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
      BlocProvider<ForgotPasswordBloc>(
        create: (BuildContext context) => ForgotPasswordBloc(ForgotPasswordInitialState()),
      ),
      BlocProvider<HomeBloc>(
        create: (BuildContext context) => HomeBloc(HomeInitialState()),
      ),
    ],
    child: NewsApp(),
  );
  runApp(blocProvider);
}
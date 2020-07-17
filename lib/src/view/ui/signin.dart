import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/view/utils/constants.dart';
import 'package:news_app/src/view/utils/reuseable_widgets.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _emailController, _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSoftGreenColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'News App',
                style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 30
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Know around the world',
                style: TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1,
                    fontSize: 18
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30),)
                ),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Sign In',
                        style: TextStyle(
                            color: kSoftBlackColor,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            fontSize: 20
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      InputTextField(
                        obscureText: false,
                        hint: 'Email',
                        iconData: Icons.email,
                        textEditingController: _emailController,
                        textInputType: TextInputType.emailAddress,
                        forgotFunction: null,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InputTextField(
                        obscureText: true,
                        hint: 'Password',
                        iconData: Icons.lock,
                        textEditingController: _passwordController,
                        textInputType: TextInputType.text,
                        forgotFunction: (){
                          print('Tapped');
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      RaisedButton(
                        color: kDarkGreenColor,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                            child: Text('Sign In', style: TextStyle(color: kWhiteColor, fontSize: 20),)
                        ),
                        onPressed: (){

                        },
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        'Create a new account',
                        style: TextStyle(
                          color: kDarkBlueColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        '@copyright reserved',
                        style: TextStyle(
                            color: kDarkBlueColor,
                            fontSize: 12,
                          fontStyle: FontStyle.italic
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


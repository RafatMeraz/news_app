import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/view/ui/home.dart';
import 'package:news_app/src/view/utils/constants.dart';
import 'package:news_app/src/view/utils/reuseable_widgets.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _userNameController, _emailController, _passwordController, _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _userNameController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
    _confirmPasswordController.dispose();
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
                        'Sign Up',
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
                        hint: 'Username',
                        iconData: Icons.person,
                        textEditingController: _userNameController,
                        textInputType: TextInputType.text,
                        forgotFunction: null,
                      ),
                      SizedBox(
                        height: 20,
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
                        forgotFunction: null,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InputTextField(
                        obscureText: true,
                        hint: 'Confirm Password',
                        iconData: Icons.lock,
                        textEditingController: _confirmPasswordController,
                        textInputType: TextInputType.text,
                        forgotFunction: null,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      RoundedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => Home()
                          ));
                        },
                        buttonText: 'Sign Up',
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Already have an account',
                          style: TextStyle(
                              color: kDarkBlueColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
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
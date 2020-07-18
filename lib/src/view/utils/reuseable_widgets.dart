import 'package:flutter/material.dart';

import 'constants.dart';

class InputTextField extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final TextEditingController textEditingController;
  final IconData iconData;
  final TextInputType textInputType;
  final Function forgotFunction;

  InputTextField({@required this.forgotFunction, @required this.textInputType, @required this.hint, @required this.obscureText, @required this.textEditingController, @required this.iconData});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: '$hint',
        fillColor: kTextFieldBgColor,
        prefixIcon: Icon(iconData),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        labelText: '$hint',
        suffix: obscureText == true ? InkWell(
          onTap: forgotFunction,
          child: Text(
            'Forgot?',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kDarkBlueColor
            ),
          ),
        ) : null,
      ),
      obscureText: obscureText,
      controller: textEditingController,
    );
  }
}

class RoundedButton extends StatelessWidget {
  RoundedButton({@required this.buttonText, @required this.onPressed});

  final String buttonText;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: RaisedButton(
        color: kDarkGreenColor,
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Text('$buttonText', style: TextStyle(color: kWhiteColor, fontSize: 20),)
        ),
        onPressed: onPressed,
      ),
    );
  }
}
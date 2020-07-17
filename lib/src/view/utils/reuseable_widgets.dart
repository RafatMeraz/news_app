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
        prefixIcon: Icon(iconData),
        border: OutlineInputBorder(),
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
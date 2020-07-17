import 'package:flutter/material.dart';
import 'package:news_app/src/view/ui/signin.dart';

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}

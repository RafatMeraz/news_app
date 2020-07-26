import 'package:flutter/material.dart';
import 'package:news_app/src/view/ui/change_password.dart';
import 'package:news_app/src/view/ui/change_username.dart';
import 'package:news_app/src/view/utils/constants.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Text('Profile', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 0.6)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.verified_user,
                size: 100,
                color: kDarkBlueColor,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: Text('Username', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.6)),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              child: Text('example@gmail.com', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300, letterSpacing: 0.6)),
            ),
            SizedBox(
              height: 16,
            ),
            Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Change Username', style: TextStyle(fontWeight: FontWeight.w500)),
                    leading: Icon(Icons.person, color: kBlackColor),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChangeUsername()));

                    },
                  ),
                  Divider(
                  ),
                  ListTile(
                    title: Text('Change Password', style: TextStyle(fontWeight: FontWeight.w500)),
                    leading: Icon(Icons.lock, color: kBlackColor),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ChangePassword()));
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text('Actions', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.6))
            ),
            Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Sign Out', style: TextStyle(fontWeight: FontWeight.w500)),
                    leading: Icon(Icons.exit_to_app, color: kBlackColor),
                    onTap: (){

                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}

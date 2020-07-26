import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/src/services/firebase_services/auth_services.dart';
import 'package:news_app/src/view/ui/home.dart';
import 'package:news_app/src/view/ui/profile.dart';
import 'package:news_app/src/view/ui/search.dart';

class BottomNavHome extends StatefulWidget {
  @override
  _BottomNavHomeState createState() => _BottomNavHomeState();
}

class _BottomNavHomeState extends State<BottomNavHome> {

  var screens = [
    Home(),
    Search(),
    Profile()
  ];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async{
    FirebaseAuthService.user = await FirebaseAuth.instance.currentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            title: Text('Headline'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
      ),
      body: screens[selectedIndex],
    );
  }
}

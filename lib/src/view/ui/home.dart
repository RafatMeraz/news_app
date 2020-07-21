import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/business_logic/blocs/signin/signin_bloc.dart';
import 'package:news_app/src/business_logic/blocs/signin/signin_events.dart';
import 'package:news_app/src/business_logic/blocs/signin/signin_states.dart';
import 'package:news_app/src/services/firebase_services/auth_services.dart';
import 'package:news_app/src/view/ui/signin.dart';
import 'package:news_app/src/view/utils/constants.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: kDarkGreenColor
              ),
              child: Text(
                'News App',
                style: TextStyle(
                  color: kWhiteColor
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.track_changes),
              title: Text('Corona Tracker'),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sign Out'),
              onTap: () async{
                await FirebaseAuthService.userSignOut();
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => SignIn()
                ));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'News App'
        ),
        elevation: 0,
        backgroundColor: kSoftGreenColor,
        actions: <Widget>[
          IconButton(
            onPressed: (){ },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 6),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  Chip(
                    label: Text('Popular'),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Chip(
                    label: Text('Corona'),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Chip(
                    label: Text('Technology'),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Chip(
                    label: Text('Medical'),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Chip(
                    label: Text('War'),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Chip(
                    label: Text('Entertainment'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: ListView(
                children: <Widget>[
                  Card(
                    elevation: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/news.jpg',),
                              fit: BoxFit.cover
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'Title will here',
                                style: TextStyle(
                                  color: kSoftBlackColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'It is a long established fact that',
                                maxLines: 3,
                                style: TextStyle(
                                  color: kSoftBlackColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Chip(
                                    label: Text('Technology', style: TextStyle(color: kWhiteColor, fontSize: 12, fontWeight: FontWeight.w500),),
                                    backgroundColor: kDarkBlueColor,
                                  ),
                                ],
                              ),
                            )
                          ],
                        )

                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

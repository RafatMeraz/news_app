import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/business_logic/blocs/home/home_bloc.dart';
import 'package:news_app/src/business_logic/blocs/home/home_events.dart';
import 'package:news_app/src/business_logic/blocs/home/home_states.dart';
import 'package:news_app/src/services/firebase_services/auth_services.dart';
import 'package:news_app/src/view/ui/signin.dart';
import 'package:news_app/src/view/utils/constants.dart';
import 'package:news_app/src/view/utils/reuseable_widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(HomeGetAllHeadlineEvent());
  }

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
              child: BlocBuilder(
                bloc: BlocProvider.of<HomeBloc>(context),
                builder: (context, state){
                  if (state is HomeNewsLoadingState){
                    return Center(child: CircularProgressIndicator());
                  } else if (state is HomeNewsErrorState){
                    return Center(child: Text("Something went wring!"),);
                  } else if (state is HomeNewsFetchedSuccessState){
                    return ListView.builder(
                        itemCount: state.newsModel.articles.length,
                        itemBuilder: (context, index){
                          return NewsCard(
                            title: state.newsModel.articles[index].title,
                            publishedAt: state.newsModel.articles[index].publishedAt,
                            imageUrl: state.newsModel.articles[index].urlToImage,
                            description: state.newsModel.articles[index].description,
                            onTap: (){},
                          );
                        }
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}


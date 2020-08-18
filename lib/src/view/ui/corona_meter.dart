import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:news_app/src/models/all_data_model.dart';

import '../../services/repository.dart';
import '../utils/constants.dart';

class CoronaMeter extends StatefulWidget {
  @override
  _CoronaMeterState createState() => _CoronaMeterState();
}

class _CoronaMeterState extends State<CoronaMeter> {
  AllData allData;
  bool inProgress =  false;
  
  @override
  void initState() {
    super.initState();
    allData = AllData();
    getAllData();
  }
  
  getAllData() async{
    setState(() {
      inProgress = true;
    });
    allData = await repository.getAllData();
    setState(() {
      inProgress = false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkBlueColor,
      body: ModalProgressHUD(
        inAsyncCall: inProgress,
        color: kDarkBlueColor,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: 90,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Corona Meter',
                        style: GoogleFonts.roboto(
                          fontSize: 24,
                          color: kWhiteColor,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.refresh, color: kWhiteColor,),
                        onPressed: (){
                          getAllData();
                        },
                      )
                    ],
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25)),
                child: Container(
                  height: MediaQuery.of(context).size.height-178,
                  width: MediaQuery.of(context).size.width,
                  color: kWhiteColor,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 5),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: <Widget>[
                              Card(
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('CASES', style: TextStyle(fontSize: 14, color: kDarkBlueColor)),
                                      Divider(color: kBlackColor, endIndent: 8, indent: 8),
                                      Text(allData.cases == null ? '00' : '${allData.cases}', style: TextStyle(fontSize: 18, color: kBlackColor, fontWeight: FontWeight.w700))
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('DEATHS', style: TextStyle(fontSize: 14, color: kDarkBlueColor)),
                                      Divider(color: kBlackColor, endIndent: 8, indent: 8),
                                      Text(allData.deaths == null ? '00' :'${allData.deaths}', style: TextStyle(fontSize: 18, color: kBlackColor, fontWeight: FontWeight.w700))
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('ACTIVE', style: TextStyle(fontSize: 14, color: kDarkBlueColor)),
                                      Divider(color: kBlackColor, endIndent: 8, indent: 8),
                                      Text(allData.active == null ? '00' :'${allData.active}', style: TextStyle(fontSize: 18, color: kBlackColor, fontWeight: FontWeight.w700))
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text('RECOVERED', style: TextStyle(fontSize: 14, color: kDarkBlueColor)),
                                      Divider(color: kBlackColor, endIndent: 8, indent: 8),
                                      Text(allData.recovered == null ? '00' :'${allData.recovered}', style: TextStyle(fontSize: 18, color: kBlackColor, fontWeight: FontWeight.w700))
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          )
        ),
      )
    );
  }
}

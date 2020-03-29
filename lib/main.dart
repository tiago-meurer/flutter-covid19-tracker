import 'dart:io';
import 'package:coronavirus_monitor/pages/advices.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:coronavirus_monitor/pages/cases.dart';
import 'package:coronavirus_monitor/pages/constants.dart';
import 'package:coronavirus_monitor/pages/deaths.dart';
import 'package:coronavirus_monitor/pages/developer.dart';
import 'package:flutter/material.dart';

//APP BY Tiago Meurer https://github.com/tiago-meurer/ - Made with love without commercial purposes <3

void main() => runApp(MaterialApp(title: "Corona", home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> containers = [
    CasesPage(),
    DeathsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coronavirus Monitor',
      home: DefaultTabController(
          length: 2,
          child: Scaffold(          
            appBar: new AppBar(      
              title: new Text('Coronavirus Tracker'),
              backgroundColor: Colors.deepOrange,             
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(text: 'Cases'),
                  Tab(text: 'Deaths'),
                ],
              ),
              actions: <Widget>[
                PopupMenuButton<String>(         
                  onSelected: choiceAction,       
                  itemBuilder: (BuildContext context) {
                    return Constants.choices.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                )
              ],            
            ),
            body: TabBarView(
              children: containers,             
            ),
          )),
    );
  }

  void choiceAction(String choice) {
    setState(() {
      if(choice == Constants.Advice){
        Navigator.push(context, MaterialPageRoute(builder: (context) => AdvicePage()));
      } else if(choice == Constants.Developer){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DeveloperPage()));
      }
    });
  }
}















import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:infigon_task/pages/AnalyzerPage.dart';
import 'package:infigon_task/pages/HomePage.dart';
import 'package:infigon_task/pages/SplashPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // hides bottom bar and status bar
    SystemChrome.setEnabledSystemUIOverlays ([]);
    return MaterialApp(
      title: 'Infigon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      //Defining routes for all the pages
      routes: <String, WidgetBuilder>{
        '/': (context) => SplashScreen(),
        '/HomePage': (context) => HomePage(),
        '/AnalyzerPage': (context) => AnalyzerPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

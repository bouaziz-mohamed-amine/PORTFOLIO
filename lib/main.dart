import 'package:flutter/material.dart';
import 'package:portfolio_app/profiles/profile_3/profile_3.dart';
import 'package:portfolio_app/profiles/profile_1/Profile_1.dart';
import 'package:portfolio_app/profiles/profile_2/profile_2.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageView(
        children: [
          Profile1(),
          Profile2(),
          Profile3(),
        ],
      ),
    );
  }
}

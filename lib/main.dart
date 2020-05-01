import 'package:flutter/material.dart';
import 'package:portfolio/profile_page.dart';
main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColorDark: Colors.black, 
        primaryColorLight: Colors.white,
        accentColor: Color(0xFF2d1484),
        fontFamily: "GoogleSansRegular",
       
      ),
      home: ProfilePage(),
    );
  }
}

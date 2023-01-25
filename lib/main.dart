import 'package:flutter/material.dart';
import 'package:untitled/screens/lastScreen.dart';
import 'package:untitled/screens/secondScreen.dart';
import './screens/myHomePage.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends  StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyAppHomePage(),
      theme: ThemeData(
       primaryColor: Colors.lightBlue,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 20 , fontStyle: FontStyle.italic),
        ),
      ),
      routes: {
        LastScreen.routeName :(ctx) => LastScreen()
      },
      // onGenerateRoute: (settings){
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx) => LastScreen());
      // },
      onUnknownRoute: (settings){
        return  MaterialPageRoute(builder: (ctx) => SecondScreen());
      },
    );
  }

}
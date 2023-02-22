import 'package:flutter/material.dart';
import 'package:watchlist_bloc/screens/MyHomePage.dart';
import 'package:watchlist_bloc/screens/search_screen.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(),
    );
  }
}


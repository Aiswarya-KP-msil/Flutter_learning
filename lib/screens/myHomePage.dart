import 'package:bloc_fetch_api_list_article/screens/tabScreen.dart';
import 'package:flutter/material.dart';

class MyHomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue[300],
                title: const Text("BLoc Pattern"),
                bottom: TabBar(tabs: [
                  Text("Home"),
                  Text("About Us"),
                  Text("Contact Us"),
                ], indicatorColor: Colors.white70),
              ),
              body: TabBarView(
                children: [
                  TabScreen(),
                  TabScreen(),
                  TabScreen(),
                ],
              ),
            )
        )
    );
  }
}
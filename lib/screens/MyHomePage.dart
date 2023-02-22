import 'package:flutter/material.dart';
import 'package:watchlist_bloc/screens/my_watchlist.dart';
import 'package:watchlist_bloc/screens/watchlist1.dart';
import 'package:watchlist_bloc/screens/watchlist2.dart';

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Watchlist',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                  text: 'My watchlist',
              ),
              Tab(
                text: 'watchlist 1',
              ),
              Tab(
                text: 'Watchlist 2',
              )
            ],
          ),
        ),
        body:
            TabBarView(
              children: [
                MyWatchlist(),
                Watchlist1(),
                Watchlist2()
              ],
            ),

      ),
    );
  }

}

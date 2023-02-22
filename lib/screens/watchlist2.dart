import 'package:flutter/material.dart';

import '../widgets/my_watchlist_item.dart';

class Watchlist2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index){
          return Card(
           // child: MyWatchlistItem(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.add),
      ),
    );
  }

}
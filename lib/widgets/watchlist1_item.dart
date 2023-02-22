import 'package:flutter/material.dart';

class Watchlist1Item extends StatelessWidget{
  final String name;
  final String phoneNum;
  final String imageUrl;

  Watchlist1Item({
    required this.name,
    required this.phoneNum,
    required this.imageUrl,

});

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title: Text(name),
      subtitle: Text(phoneNum),
      trailing: CircleAvatar(
        backgroundImage:NetworkImage(imageUrl),
      ),
    );
  }

}
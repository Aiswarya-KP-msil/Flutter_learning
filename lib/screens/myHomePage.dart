import 'package:flutter/material.dart';
import 'package:provider_pattern/screens/calls_screen.dart';
import 'package:provider_pattern/screens/chats_screen.dart';
import 'package:provider_pattern/screens/status_screen.dart';

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("WhatsApp"),
            actions: [
              IconButton(onPressed: null, icon: Icon(Icons.camera_alt_outlined)),
              IconButton(onPressed: null, icon: Icon(Icons.search)),
              PopupMenuButton(
                icon: Icon(Icons.more_vert),
                itemBuilder: (_) => [
                  PopupMenuItem(child: Text('New groups'),value: 0,),
                  PopupMenuItem(child: Text('New broadcast'),value: 1,),
                  PopupMenuItem(child: Text('Linked devices'),value: 2,),
                  PopupMenuItem(child: Text('Starred messages'),value: 3,),
                  PopupMenuItem(child: Text('Payments'),value: 4,),
                  PopupMenuItem(child: Text('Settings'),value: 5,),

                ],
              )
            ],
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Chats",
                ),
                Tab(
                  text: "Status",
                ),
                Tab(
                  text: "Calls",
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ChatsScreen(),
              StatusScreen(),
              CallsScreen(),

            ],
          ),
        )
    );
  }

}
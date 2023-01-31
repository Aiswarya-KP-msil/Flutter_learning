import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_pattern/widgets/chat_item.dart';

import '../providers/chatsListProvider.dart';

class ChatsScreen extends StatelessWidget{
  var newChat = ChatsListItem(id: null,
      name: 'Emerson',
      chatDesription: 'how was your day',
      proPicUrl: 'https://media.istockphoto.com/id/1338134336/photo/headshot-portrait-african-30s-man-smile-look-at-camera.jpg?s=612x612&w=is&k=20&c=Qq7b7kkCYor4mHJow_7CNIwq5CUlXpv56frkhc78tk4=',
      date: DateTime.now());
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChatsList>(context);
    final  providerData = provider.items;
    return  Scaffold(
      body: ListView.builder(
            itemBuilder: (ctx,i) => ChangeNotifierProvider.value(
              value: providerData[i] ,
              child: Dismissible(
                  child: ChatItem(),
                  onDismissed: (direction){
                    provider.deleteChat(providerData[i].id);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('${providerData[i].name} chat deleting')));
                  },
                  background: Container(
                      color: Colors.red,
                          child: Icon(Icons.delete),
                  ),
                key: Key(providerData[i].id),
                direction: DismissDirection.endToStart,
              ),
            ),
            itemCount: providerData.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.addNewCahat(newChat);
        },
        child: Icon(Icons.chat),
      ),
    );
  }
}

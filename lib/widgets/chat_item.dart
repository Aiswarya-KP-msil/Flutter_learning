import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:provider_pattern/providers/chatsListProvider.dart';

class ChatItem extends StatelessWidget{
  // String imageUrl;
  // String name;
  // String chatDescription;
  // String date;
  // ChatItem({
  //   @required this.imageUrl,
  //   @required this.name,
  //   @required this.chatDescription,
  //   @required this.date
  // });
  @override
  Widget build(BuildContext context) {
    final chats = Provider.of<ChatsListItem>(context,listen: false);
    String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(chats.date);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(chats.proPicUrl)
      ),
      title: Text(chats.name),
      subtitle: Row(
        children: [
          Text(chats.chatDesription)
        ],
      ),
      trailing: Text(formattedDate),
    );
  }

}
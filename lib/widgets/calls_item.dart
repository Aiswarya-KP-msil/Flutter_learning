import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_pattern/providers/callsProvider.dart';


class CallsItem extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final callsData = Provider.of<CallsList>(context,listen: false);
    return ListTile(
      leading: CircleAvatar(
          backgroundImage: NetworkImage(callsData.imageUrl)
      ),
      title: Text(callsData.name),
      subtitle: Row(
        children: [
          Text(callsData.callDuration)
        ],
      ),
      trailing: callsData.callType == 'videoCall'? Icon(
        Icons.video_call
      ): Icon(
          Icons.call
      ),
    );
  }

}
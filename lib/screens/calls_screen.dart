import 'package:flutter/material.dart';
import 'package:provider_pattern/providers/callsProvider.dart';
import 'package:provider/provider.dart';
import 'package:provider_pattern/widgets/calls_item.dart';

class CallsScreen extends StatefulWidget{
  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  final dummyCallList =
    CallsList(
        id: 'c1',
        name: 'manu',
        callDuration: '2hr',
        imageUrl:'https://miro.medium.com/max/785/0*Ggt-XwliwAO6QURi.jpg',
        callType: 'videoCall'
    );
  Future<void> _refreshProduct(BuildContext context) async{
    await Provider.of<CallsProvider>(context,listen: false).fetchAndSetCalls();
  }

  Future<void> _addCallstofirebase() async{
    try {
      await Provider.of<CallsProvider>(context, listen: false)
          .addcalls(dummyCallList);
    } catch (error) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('An error occurred!'),
          content: Text('Something went wrong.'),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      );
    } finally {
      Navigator.of(context).pop();
    }

  }

  @override
  Widget build(BuildContext context) {
    final callsData = Provider.of<CallsProvider>(context);
    final calls =  callsData.calls;
    return Scaffold(
     body: RefreshIndicator(
         onRefresh: () => _refreshProduct(context),
       child: ListView.builder(
         itemBuilder: (ctx,i)=>ChangeNotifierProvider.value(
             value: calls[i],
             child: CallsItem()),
           itemCount: calls.length,
       ),
     ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addCallstofirebase();
        },
        child: Icon(Icons.add),

      ),
    );
  }
}
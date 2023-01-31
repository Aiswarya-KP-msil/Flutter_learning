import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class CallsList with ChangeNotifier{
  String id;
  String name;
  String callDuration;
  String imageUrl;
  String callType;


  CallsList(
    {
      @required this.id,
      @required this.name,
      @required this.callDuration,
      @required this.imageUrl,
      @required this.callType,
    }
  );
}

class CallsProvider with ChangeNotifier{
  List<CallsList> _calls = [];
  List<CallsList> get calls{
    return[..._calls];
  }
 static const url = 'https://whatsappprovider-fbe94-default-rtdb.firebaseio.com/calls.json';
 Future<void> addcalls(CallsList callsList) async{
   print(callsList);

   try{
     await http.post(url,body: json.encode(
       {
        'id' : callsList.id,
         'name' : callsList.name,
         'callDuration' : callsList.callDuration,
         'imageUrl' : callsList.imageUrl,
         'callType' : callsList.callType
       }
     ));
    //
    //  final newCalls = CallsList(
    //      id: json.decode(response.body)['name'],
    //      name: callsList.name,
    //      callDuration: callsList.callDuration,
    //      imageUrl: callsList.imageUrl,
    //      callType: callsList.callType
    //  ) ;
    // _calls.add(newCalls);
   // notifyListeners();

   }catch(error){
     throw error;

   }
   return Future.value();
 }

  Future<void> fetchAndSetCalls() async {


    try{
      final response = await http.get(url);
      final extractData = json.decode(response.body) as Map<String,dynamic>;
      print(json.decode(response.body));
      print(extractData);
      final List <CallsList> loadedCalls = [

      ];
      extractData.forEach((callId, callData ) {
        loadedCalls.add(CallsList(id: callId,
            name: callData['name'],
            callDuration: callData['callDuration'],
            imageUrl: callData['imageUrl'],
            callType: callData['callType'])

        );
      });
      _calls = loadedCalls;
      notifyListeners();
    }catch(error){
      throw error;

    }

  }

}
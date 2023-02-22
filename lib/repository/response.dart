import 'package:shared_preferences/shared_preferences.dart';
import 'package:watchlist_bloc/model/contacts.dart';
import 'package:http/http.dart' ;
import 'dart:convert';

class WatchlistRepository{
  static const getContactsUrl="http://5e53a76a31b9970014cf7c8c.mockapi.io/msf/getContacts";
  Future<List<ContactsModel>> fetchData() async {
    var response=await get(Uri.parse(getContactsUrl));
    if(response.statusCode == 200){
      List jsonResponse=json.decode(response.body);


      //Add to prefernce
      var pref = await SharedPreferences.getInstance();
      List<ContactsModel> listData = jsonResponse.map((e) => ContactsModel.fromJson(e)).toList();
      final dataString = jsonEncode(listData);
      await pref.setString('user-list', dataString);
      var values = pref.getString('user-list');
      print(values.toString());
      return jsonResponse.map((data) => ContactsModel.fromJson(data)).toList();
    }else{
      throw Exception("Error occured");
    }

  }

}
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HomeRepository{
  static const url = 'https://my-flutter-app-6c860-default-rtdb.firebaseio.com/products.json';
  static Future<String> fetchRandomApi()async{
    try{
      final Response response = await http.get(url);
      if(response.statusCode == 200 || response.statusCode == 201){
        final extractData = json.decode(response.body) as Map<String,dynamic>;
        print(json.decode(response.body));
        print(extractData);
        var loadedProducts ;
        extractData.forEach((prodId, prodData ) {
          loadedProducts = prodData['title'];
        });

        return loadedProducts;
      }else{
        throw Exception();
      }
    }catch(e){
      throw Exception();
    }
  }
}
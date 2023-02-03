
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/api_result_model.dart';

class Response{
  static const cricArticleUrl="https://jsonplaceholder.typicode.com/photos";
  Future<List<ApiResultModel>> fetchData() async {
    var response=await http.get(cricArticleUrl);
    if(response.statusCode == 200){
      List jsonResponse=json.decode(response.body);
      return jsonResponse.map((data) => ApiResultModel.fromJson(data)).toList();
    }else{
      throw Exception("Error occured");
    }

  }

}
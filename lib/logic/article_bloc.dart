import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../model/api_result_model.dart';
import '../repository/response.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {

  List<ApiResultModel> contactdata;
  Response contacts= Response();
  ArticleBloc() : super(WatchlistInitial()) {
    on<ArticleEvent>((event, emit) async{
      if (event is FetchArticleEvent) {
          contactdata = await contacts.fetchData();
          if (contactdata.isNotEmpty) {
            emit(WatchlistFetchData(contacts: contactdata));
          }
      }
    });
  }
}

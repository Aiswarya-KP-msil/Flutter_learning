import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/contacts.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  List<ContactsModel> watchList1 = [];
  SearchBloc() : super(SearchInitial()) {
    on<FetchDataEvent>((event, emit) async {
      print('called search bloc');
      try {
        var preferences = await SharedPreferences.getInstance();
        final string1 = preferences.getString('watchlist1');
        if (string1 != null) {
          final userList = jsonDecode(string1) as List;
          watchList1 = userList.map((e) => ContactsModel.fromJson(e)).toList();
        } else {
          print('Watchlist1 is null');
        }
        final users = watchList1;
        emit(SearchFetchData( contacts: users));
      } catch (e) {
        throw Exception(e);
      }
    });
  }
}

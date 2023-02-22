import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watchlist_bloc/screens/watchlist1.dart';

import '../../model/contacts.dart';

part 'watchlist1_event.dart';
part 'watchlist1_state.dart';

class Watchlist1Bloc extends Bloc<Watchlist1Event, Watchlist1State> {


  Watchlist1Bloc() : super(Watchlist1Initial()) {
    on<Watchlist1Event>((event, emit) async {
      if (event is Watchlist1FetchContactEvent) {
        List<ContactsModel> userlist = [];
        var preferences = await SharedPreferences.getInstance();
        final string1 = preferences.getString('watchlist1-tabData');
        if (string1 != null) {
          var userList = jsonDecode(string1) as List;
          userlist = userList.map((e) => ContactsModel.fromJson(e)).toList();
          emit(Watchlist1FetchData( contacts: userlist));
        }
      }
    });
  }
}
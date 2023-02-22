import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../model/contacts.dart';
import '../../repository/response.dart';

part 'watchlist_event.dart';
part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  late List<ContactsModel> contactsData;
  WatchlistRepository contacts = WatchlistRepository();
  WatchlistBloc() : super(WatchlistInitial()) {
    on<WatchlistEvent>((event, emit) async {
      if (event is FetchContactEvent) {
        contactsData = await contacts.fetchData();
        if (contactsData.isNotEmpty) {
          emit(WatchlistFetchData(contacts: contactsData));
        }
      }
    });
  }

}

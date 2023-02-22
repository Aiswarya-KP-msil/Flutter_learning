part of 'watchlist1_bloc.dart';

@immutable
abstract class Watchlist1State {

}

class Watchlist1Initial extends Watchlist1State {}


class Watchlist1FetchData extends Watchlist1State {
  final List<ContactsModel> contacts;

  Watchlist1FetchData({
    required this.contacts,
  });

}
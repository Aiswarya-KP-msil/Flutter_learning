part of 'watchlist_bloc.dart';

@immutable
abstract class WatchlistState {}

class WatchlistInitial extends WatchlistState {}

class WatchlistFetchData extends WatchlistState {
  final List<ContactsModel> contacts;

  WatchlistFetchData({
    required this.contacts,
  });

}

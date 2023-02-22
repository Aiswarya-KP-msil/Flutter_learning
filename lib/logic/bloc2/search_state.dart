part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchFetchData extends SearchState{

  final List<ContactsModel> contacts;

  SearchFetchData({
    required this.contacts,
  });

}

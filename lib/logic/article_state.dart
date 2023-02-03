part of 'article_bloc.dart';
abstract class ArticleState {}

class WatchlistInitial extends ArticleState {}

class WatchlistFetchData extends ArticleState {
  final List<ApiResultModel> contacts;

  WatchlistFetchData({
    @required this.contacts,
  });

}

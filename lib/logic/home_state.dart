part of 'home_bloc.dart';

class HomeState {
  final bool isApiFetching;
  final String result;
  HomeState(
  {
    @required this.isApiFetching,
    this.result
  }
  );
}

class HomeInitial extends HomeState {
  HomeInitial({@required bool isApiFetching}) : super(isApiFetching: isApiFetching);

}

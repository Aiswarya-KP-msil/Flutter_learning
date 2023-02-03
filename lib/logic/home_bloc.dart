import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_fetch_api/repository/home_repository.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial(isApiFetching: false)) {
    on<FetchApiEvent>((event, emit) async {
      emit(HomeState(isApiFetching: true));
      final data = await HomeRepository.fetchRandomApi();
      emit(HomeState(isApiFetching: false, result: data));

    });
  }
}

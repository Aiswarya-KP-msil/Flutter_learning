import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_watchlist_event.dart';
part 'add_watchlist_state.dart';

class AddWatchlistBloc extends Bloc<AddWatchlistEvent, AddWatchlistState> {
  AddWatchlistBloc() : super(AddWatchlistInitial()) {
    on<AddWatchlistEvent>((event, emit) {
      if(event is ButtonPressedEvent){
        emit(ButtonPressState());
      }
    });
  }
}

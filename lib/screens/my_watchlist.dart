import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc/logic/bloc1/watchlist_bloc.dart';
import 'package:watchlist_bloc/screens/search_screen.dart';
import 'package:watchlist_bloc/widgets/my_watchlist_item.dart';

class MyWatchlist extends StatefulWidget{
  @override
  State<MyWatchlist> createState() => _MyWatchlistState();
}

class _MyWatchlistState extends State<MyWatchlist> {
  WatchlistBloc watchlistBlock = WatchlistBloc();

  @override
  void initState(){
    watchlistBlock.add(FetchContactEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (context) => watchlistBlock,  
      child: Scaffold(
          body: BlocBuilder<WatchlistBloc,WatchlistState>(
            builder: (context, state) {
              if(state is WatchlistFetchData){
                return ListView.builder(
                  itemCount: state.contacts.length,
                  itemBuilder: (BuildContext context, int index){
                    return Card(
                      child: MyWatchlistItem(
                        name: state.contacts[index].name,
                        phoneNum: state.contacts[index].contacts,
                        imageUrl: state.contacts[index].url,
                      )
                    );
                  },
                );
              }else{
                return const Center(child:  CircularProgressIndicator());
              }
            } ),
      ),
    );
  }
}
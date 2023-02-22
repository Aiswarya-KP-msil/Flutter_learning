import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist_bloc/model/contacts.dart';
import 'package:watchlist_bloc/screens/search_screen.dart';

import '../logic/bloc4/watchlist1_bloc.dart';
import '../widgets/my_watchlist_item.dart';
import '../widgets/watchlist1_item.dart';

class Watchlist1 extends StatefulWidget {
  @override
  State<Watchlist1> createState() => _Watchlist1State();
}

class _Watchlist1State extends State<Watchlist1> {

  Watchlist1Bloc watchlist1Block = Watchlist1Bloc();
  List<ContactsModel> loadedUserlist = [];

  @override
  void initState() {
    watchlist1Block.add(Watchlist1FetchContactEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => watchlist1Block,
      child: Scaffold(
        body: BlocBuilder<Watchlist1Bloc, Watchlist1State>(
          builder: (context, state) {
            if(state is Watchlist1FetchData){
              loadedUserlist = state.contacts;
              return ListView.builder(
                itemCount: state.contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Watchlist1Item(name: state.contacts[index].name,
                      imageUrl: state.contacts[index].url,
                      phoneNum: state.contacts[index].contacts),
                  );
                },
              );
            }else{
              return const Center(child:  CircularProgressIndicator());
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchScreen(currentWatchlist: loadedUserlist),
                ));

          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
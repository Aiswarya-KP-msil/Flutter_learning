import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watchlist_bloc/logic/bloc2/search_bloc.dart';
import 'package:watchlist_bloc/model/contacts.dart';
import '../logic/bloc3/add_watchlist_bloc.dart';
import '../widgets/search_item.dart';

class SearchScreen extends StatelessWidget{
  static const routeName = '/search-screen';
  List<ContactsModel> currentWatchlist;
  SearchScreen({
    required this.currentWatchlist
  });

  final TextEditingController _controller = TextEditingController();

  Future getdata(String txt) async {
    List<ContactsModel> watchList1 = [];
    print('get data called');
    var preferences = await SharedPreferences.getInstance();
    List<ContactsModel>? userlist = [];

    var valueString = preferences.getString('user-list');
    print(valueString);
    if (valueString != null) {
      final userList = jsonDecode(valueString) as List;
      userlist = userList.map((e) => ContactsModel.fromJson(e)).toList();
    } else {
      print('list is null');
    }
    for (int i = 0; i < userlist.length; i++) {
      if (userlist.elementAt(i).name.contains(txt)) {
        watchList1.add(userlist.elementAt(i));
      }
    }
    final watchListSring = jsonEncode(watchList1);
    await preferences.setString('watchlist1', watchListSring);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: ( context) => SearchBloc()),
          BlocProvider(create: ( context) => AddWatchlistBloc()),
        ],

        child: BlocBuilder<SearchBloc,SearchState>(
          builder: (context, state) {
            if(state is SearchFetchData){
              List<ContactsModel> userList = state.contacts;
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: TextField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: 'Name *',
                      ),
                      onSubmitted: (value){
                        getdata(_controller.text);
                        _controller.clear();
                        BlocProvider.of<SearchBloc>(context)
                            .add(FetchDataEvent());
                      },
                      controller: _controller,
                    ),
                  ),
                  Expanded(
                      child: SearchItem(userList: userList,CurrentList: currentWatchlist)
                  )
                ],
              );
            }else{
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: TextField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: 'Name *',
                      ),
                      onSubmitted: (value){
                        getdata(_controller.text);
                        _controller.clear();
                        BlocProvider.of<SearchBloc>(context)
                            .add(FetchDataEvent());
                      },
                      controller: _controller,
                    ),
                  ),
                  Expanded(
                      child: Center(child:  Text("Search here"))
                  )
                ],
              );
            }
          }),
        ),
    );
  }
}



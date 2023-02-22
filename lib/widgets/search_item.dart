import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watchlist_bloc/logic/bloc3/add_watchlist_bloc.dart';
import 'package:watchlist_bloc/model/contacts.dart';

class SearchItem extends StatelessWidget{
  final List<ContactsModel> userList;
  final List<ContactsModel> CurrentList;


  SearchItem({required this.userList,required this.CurrentList});
  @override
  Widget build(BuildContext context) {
    List<ContactsModel> selecteduserlist = [];
    List<int> selectedIndexList = [];
    return BlocBuilder<AddWatchlistBloc,AddWatchlistState>(
      builder: (context,state){
        return ListView.builder(
          itemCount: userList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Card(
                child: CheckboxListTile(
                  title: Text(
                    '${userList[index].name} ',
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  subtitle: Text(
                    '${userList[index].contacts} ',
                    style: const TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  autofocus: false,
                  activeColor: Colors.green,
                  checkColor: Colors.white,
                  onChanged: (value) {
                    if ((selectedIndexList.isEmpty) || !(selectedIndexList.contains(index))) {
                      selectedIndexList.add(index);
                      selecteduserlist.add(userList[index]);
                    } else {
                      selectedIndexList.remove(index);
                      selecteduserlist.remove(userList[index]);
                    }
                    addtoDB(selecteduserlist);
                    BlocProvider.of<AddWatchlistBloc>(context)
                        .add(ButtonPressedEvent());
                  },
                  selected: false,
                  value: selectedIndexList.contains(index),
                ),
              ),
            );
          },
        );
      },

    ) ;
  }

  Future<void> addtoDB(List<ContactsModel> userlist) async {
    var pref = await SharedPreferences.getInstance();
      userlist = userlist + CurrentList;
      final strList1 = jsonEncode(userlist);
      pref.setString('watchlist1-tabData', strList1);
  }
}
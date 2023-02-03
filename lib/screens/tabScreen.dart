
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/article_bloc.dart';


class TabScreen extends StatefulWidget {

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  ArticleBloc articleBloc = ArticleBloc();

  @override
  void initState() {
    articleBloc.add(FetchArticleEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => articleBloc,
      child: Scaffold(
        body: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is WatchlistFetchData) {
              return ListView.builder(

                  padding: const EdgeInsets.all(10),
                  itemCount: state.contacts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        child: ListTile(
                          tileColor: Colors.lightBlue[50],
                          trailing: CircleAvatar(
                            backgroundImage:
                            NetworkImage(state.contacts[index].url),
                          ),
                          title: Text(state.contacts[index].title),
                          subtitle: Text(state.contacts[index].thumbnailUrl),
                        ));
                  });
            } else {
              return const Center(child:  CircularProgressIndicator());
            }

          },
        ),
      ),
    );
  }
}
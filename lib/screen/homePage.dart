import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/home_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Flutter BLoC'),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.isApiFetching?Center(
            child: CircularProgressIndicator(
              color: Colors.pinkAccent,
            ),
          ):Center(
            child: Text(state.result ?? "No DATA",
              style: TextStyle(
                  fontSize: 30
              ),),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            context.read<HomeBloc>().add(FetchApiEvent());
          },
          label: Text('FetchApi')),
    );
  }

}
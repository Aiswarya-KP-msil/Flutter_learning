import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_pattern/providers/callsProvider.dart';
import 'package:provider_pattern/providers/chatsListProvider.dart';
import 'package:provider_pattern/screens/myHomePage.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: ChatsList()),
        ChangeNotifierProvider.value(value: CallsProvider())
      ],
      child: MaterialApp(
        title: 'Provider',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: MyHomePage(),
      ),
    );
  }
}


import 'package:flutter/material.dart';

class LastScreen extends StatelessWidget{
  static const routeName = '/last-screen';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('PushNamed navigation screen'),
      ),
      body: Center(
        child:
            Center(
              child: Container(
                margin: EdgeInsets.all(15),
                child: ListView(
                  children: [
                    Text('Topics covered'),
                    Text('1.Push'),
                    Text('2.Pop'),
                    Text('3.Push with data'),
                    Text('4.PushNamed'),
                    Text('5.PushNamed with agruments'),
                    Container(
                      child: Center(
                        child: Text(args,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.lightGreen
                        ),),
                      ),
                    )
                  ],
                ),
              ),
            )
      ),
    );
  }

}
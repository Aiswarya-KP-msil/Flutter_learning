import 'package:flutter/material.dart';
import 'package:untitled/screens/secondScreen.dart';

class MyAppHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Types of routes',
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Center(
          child: Column(
            children: [
              Text(
                'TASK 2 - Types of routes'
              ),
              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.black
                  ),
                ),
                child: Column(
                  children: [
                    Text('1.The way to handle the navigation is known as routing.'),
                    Text('2. Flutter provides a basic routing class MaterialPageRoute and two methods Navigator.push() and Navigator.pop()'),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (_)=>SecondScreen()));

        },
        child: const Icon(
            Icons.arrow_right
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
    );
  }
}

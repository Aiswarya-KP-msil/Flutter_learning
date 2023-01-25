import 'package:flutter/material.dart';
import 'package:untitled/screens/third_screen.dart';

class SecondScreen extends StatelessWidget{
  String title = 'Navigator.push()';
  String description ='The Navigator.push() method is used to navigate/switch to a new route/page/screen'+
      'Here, the push() method adds a page/route on the stack and then manage it by using the Navigator. '+
      'Here using constructor passing the data from one screen to another';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PUSH'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ThirdScreen(title: title, description: description) )
                  );

                },
                child: Text('Click here to go next screen '))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back),
        label: Text(
          'Pop button'
        ),

      ),
    );
  }

}
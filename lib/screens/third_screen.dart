import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/screens/lastScreen.dart';

class ThirdScreen extends StatelessWidget{
  String title;
  String description;
  String completeText = "Successfully completed Types of routes";
  ThirdScreen(
    {
      @required this.title,
      @required this.description
    }
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push with data'),
      ),
      body: Center(
        child: Column(
          children: [
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
                  Text(title,textAlign: TextAlign.center,style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                   Text(description,
                      maxLines: 5,),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1,
                          color: Colors.black
                      ),
                    ),
                    child: Text(
                      'This function takes two required arguments (build context and string)'
                        +'and one optional argument. Also, we know about the MaterialPageRoute,'
                        +'which is responsible for page transition',
                      maxLines: 4,

                    ),
                  )

                ],
              ),
            ),
            OutlineButton(onPressed: (){
              Navigator.of(context).pushNamed(LastScreen.routeName,arguments:completeText);
            }, child: Text('PushNamed'))

          ] ,
        ),
      ),
    );
  }

}
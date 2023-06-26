import 'package:flutter/material.dart';
import 'package:google_mao/SelectRouteForSharing.dart';
import 'package:google_mao/TeacherLocationSharing.dart';


class landingPage extends StatelessWidget {
  @override
Widget build(BuildContext context) => Scaffold(

  appBar: AppBar(
    title: Text("Selection Page"),
    centerTitle: true,
  ),
  body: Center(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(padding: EdgeInsets.all(20)),
   

      child: Text("Teacher"),
      onPressed: () {
      Navigator.push(context, MaterialPageRoute (builder: (context) => selectRouteForSharing()),
    
      );
    }
  ),
)
);
//yo
} 
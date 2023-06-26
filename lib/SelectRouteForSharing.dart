import 'package:flutter/material.dart';
import 'package:google_mao/TeacherLocationSharing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class selectRouteForSharing extends StatelessWidget {
  @override
Widget build(BuildContext context) => Scaffold(

  appBar: AppBar(
    title: Text("Selection Page"),
    centerTitle: true,
  ),
  body: Center(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(padding: EdgeInsets.all(20)),
   

      child: Text("Route:1"),
      onPressed: () {
        
         
         
        /* StreamBuilder(
         
                stream: FirebaseFirestore.instance
                    .collection('isUsing').snapshots(),
                    
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  DocumentSnapshot index1  = snapshot.data!.docs.singleWhere(((element) => element.id=='index1' ));

                  if ((index1.get('insideRouteScreen'))==true){
                      return 
                      const Text(
                        'Bus Route Already Sharing',
                        style: const TextStyle(color: Colors.yellow),
                         textAlign: TextAlign.center,
                         textDirection: TextDirection.ltr,
                       );
                }
                else{
                  Navigator.push(context, MaterialPageRoute (builder: (context) => TeacherLocationSharing()));
                  _updateInsideRouteScreen();
                   return Text('');
                }
                }
                );
     */
     _updateInsideRouteScreen();
     Navigator.push(context, MaterialPageRoute (builder: (context) => TeacherLocationSharing()));
    }
  ),
)
);

Future <void> _updateInsideRouteScreen() async {
    await FirebaseFirestore.instance
        .collection("isUsing")
        .doc('index1')
        .update({
      'insideRouteScreen': true,
    });
  }



}








import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_mao/TeacherLocationSharing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';




class selectRouteForSharing extends StatelessWidget {
  late DocumentSnapshot snapshot;
  bool flagForinsideRouteScreenFound = false;
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
       var db = FirebaseFirestore.instance;
          db.collection("isUsing").where('insideRouteScreen' , isEqualTo: false).get().then(
  (querySnapshot) {
   

    for (var docSnapshot in querySnapshot.docs) { 
     if(docSnapshot.id == 'index1'){
          Navigator.push(context, MaterialPageRoute (builder: (context) => TeacherLocationSharing()));   
       _updateInsideRouteScreen();
       flagForinsideRouteScreenFound = true;
           break;
     }
    }
    if(!flagForinsideRouteScreenFound){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content:
          Container(
           child: Text('Route Is Already Being Shared'),
         //  decoration: BoxDecoration(color:Color.fromARGB(255, 255, 249, 250)),
           
          ),
                  behavior: SnackBarBehavior.floating,
              //    backgroundColor: Colors.transparent,
                  elevation: 0,
                  
          )
          
        );
    }
  },

);
        

           
         
                
     
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


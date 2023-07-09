import 'package:flutter/material.dart';
import 'package:google_mao/TeacherLocationSharing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class selectRouteForSharing extends StatelessWidget {
  late DocumentSnapshot snapshot;
  bool flagForinsideRouteScreenFound = false;

  selectRouteForSharing({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text("Selection Page"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
            child: const Text("Route:1"),
            onPressed: () {
              var db = FirebaseFirestore.instance;
              db
                  .collection("isUsing")
                  .where('insideRouteScreen', isEqualTo: false)
                  .get()
                  .then(
                (querySnapshot) {
                  for (var docSnapshot in querySnapshot.docs) {
                    if (docSnapshot.id == 'index1') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const TeacherLocationSharing()));
                      _updateInsideRouteScreen();
                      flagForinsideRouteScreenFound = true;
                      break;
                    }
                  }
                  if (!flagForinsideRouteScreenFound) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Container(
                        child: const Text('Route Is Already Being Shared'),
                      ),
                      behavior: SnackBarBehavior.floating,
                      elevation: 0,
                    ));
                  }
                },
              );
            }),
      ));

  Future<void> _updateInsideRouteScreen() async {
    await FirebaseFirestore.instance
        .collection("isUsing")
        .doc('index1')
        .update({
      'insideRouteScreen': true,
    });
  }
}

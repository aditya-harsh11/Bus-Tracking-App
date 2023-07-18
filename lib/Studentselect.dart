import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_mao/StudentView.dart';

class studentselect extends StatelessWidget {
  late DocumentSnapshot snapshot;
  bool flagForinsideRouteScreenFound = false;

  studentselect({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text("Selection Page"),
        centerTitle: true,
      ),
      body: Center(
          child: ElevatedButton(
              style:
                  ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
              child: const Text("Route:1"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const studentView()),
                );
              })));
}

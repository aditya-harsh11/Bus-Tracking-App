import 'package:flutter/material.dart';
import 'package:google_mao/TeacherLocationSharing/TeacherLocationSharing1.dart';
import 'package:google_mao/TeacherLocationSharing/TeacherLocationSharing10.dart';
import 'package:google_mao/TeacherLocationSharing/TeacherLocationSharing11.dart';
import 'package:google_mao/TeacherLocationSharing/TeacherLocationSharing12.dart';
import 'package:google_mao/TeacherLocationSharing/TeacherLocationSharing13.dart';
import 'package:google_mao/TeacherLocationSharing/TeacherLocationSharing14.dart';
import 'package:google_mao/TeacherLocationSharing/TeacherLocationSharing2.dart';
import 'package:google_mao/TeacherLocationSharing/TeacherLocationSharing3.dart';
import 'package:google_mao/TeacherLocationSharing/TeacherLocationSharing4.dart';
import 'package:google_mao/TeacherLocationSharing/TeacherLocationSharing5.dart';
import 'package:google_mao/TeacherLocationSharing/TeacherLocationSharing6.dart';
import 'package:google_mao/TeacherLocationSharing/TeacherLocationSharing7.dart';
import 'package:google_mao/TeacherLocationSharing/TeacherLocationSharing8.dart';
import 'package:google_mao/TeacherLocationSharing/TeacherLocationSharing9.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class selectRouteForSharing extends StatelessWidget {
  late DocumentSnapshot snapshot;
  bool flagForinsideRouteScreenFound = false;

  selectRouteForSharing({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selection Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 1"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TeacherLocationSharing1()),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 2"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TeacherLocationSharing2()),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 3"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TeacherLocationSharing3()),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 4"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TeacherLocationSharing4()),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 5"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TeacherLocationSharing5()),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 6"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TeacherLocationSharing6()),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 7"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TeacherLocationSharing7()),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 8"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TeacherLocationSharing8()),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 9"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TeacherLocationSharing9()),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 10"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TeacherLocationSharing10()),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 11"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TeacherLocationSharing11()),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 12"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TeacherLocationSharing12()),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 13"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TeacherLocationSharing13()),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 14"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const TeacherLocationSharing14()),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateInsideRouteScreen1() async {
    await FirebaseFirestore.instance
        .collection("isUsing")
        .doc('index1')
        .update({
      'insideRouteScreen1': true,
    });
  }

  Future<void> _updateInsideRouteScreen2() async {
    await FirebaseFirestore.instance
        .collection("isUsing")
        .doc('index2')
        .update({
      'insideRouteScreen2': true,
    });
  }

  Future<void> _updateInsideRouteScreen3() async {
    await FirebaseFirestore.instance
        .collection("isUsing")
        .doc('index3')
        .update({
      'insideRouteScreen3': true,
    });
  }

  Future<void> _updateInsideRouteScreen4() async {
    await FirebaseFirestore.instance
        .collection("isUsing")
        .doc('index4')
        .update({
      'insideRouteScreen4': true,
    });
  }

  Future<void> _updateInsideRouteScreen5() async {
    await FirebaseFirestore.instance
        .collection("isUsing")
        .doc('index5')
        .update({
      'insideRouteScreen5': true,
    });
  }

  Future<void> _updateInsideRouteScreen6() async {
    await FirebaseFirestore.instance
        .collection("isUsing")
        .doc('index6')
        .update({
      'insideRouteScreen6': true,
    });
  }

  Future<void> _updateInsideRouteScreen7() async {
    await FirebaseFirestore.instance
        .collection("isUsing")
        .doc('index7')
        .update({
      'insideRouteScreen7': true,
    });
  }

  Future<void> _updateInsideRouteScreen8() async {
    await FirebaseFirestore.instance
        .collection("isUsing")
        .doc('index8')
        .update({
      'insideRouteScreen8': true,
    });
  }

  Future<void> _updateInsideRouteScreen9() async {
    await FirebaseFirestore.instance
        .collection("isUsing")
        .doc('index9')
        .update({
      'insideRouteScreen9': true,
    });
  }

  Future<void> _updateInsideRouteScreen10() async {
    await FirebaseFirestore.instance
        .collection("isUsing")
        .doc('index10')
        .update({
      'insideRouteScreen10': true,
    });
  }

  Future<void> _updateInsideRouteScreen11() async {
    await FirebaseFirestore.instance
        .collection("isUsing")
        .doc('index11')
        .update({
      'insideRouteScreen11': true,
    });
  }

  Future<void> _updateInsideRouteScreen12() async {
    await FirebaseFirestore.instance
        .collection("isUsing")
        .doc('index12')
        .update({
      'insideRouteScreen12': true,
    });
  }

  Future<void> _updateInsideRouteScreen13() async {
    await FirebaseFirestore.instance
        .collection("isUsing")
        .doc('index13')
        .update({
      'insideRouteScreen13': true,
    });
  }

  Future<void> _updateInsideRouteScreen14() async {
    await FirebaseFirestore.instance
        .collection("isUsing")
        .doc('index14')
        .update({
      'insideRouteScreen14': true,
    });
  }
}

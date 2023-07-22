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
                        onPressed: () async {
                          var db = FirebaseFirestore.instance;
                          db
                              .collection("isUsing")
                              .where('insideRouteScreen1', isEqualTo: false)
                              .get()
                              .then(
                            (querySnapshot) {
                              for (var docSnapshot in querySnapshot.docs) {
                                if (docSnapshot.id == 'index1') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TeacherLocationSharing1()));
                                  _updateInsideRouteScreen1();
                                  flagForinsideRouteScreenFound = true;
                                  break;
                                }
                              }
                              if (!flagForinsideRouteScreenFound) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Container(
                                    child:
                                        Text('Route Is Already Being Shared'),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  elevation: 0,
                                ));
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 2"),
                        onPressed: () async {
                          var db = FirebaseFirestore.instance;
                          db
                              .collection("isUsing")
                              .where('insideRouteScreen2', isEqualTo: false)
                              .get()
                              .then(
                            (querySnapshot) {
                              for (var docSnapshot in querySnapshot.docs) {
                                if (docSnapshot.id == 'index2') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TeacherLocationSharing2()));
                                  _updateInsideRouteScreen2();
                                  flagForinsideRouteScreenFound = true;
                                  break;
                                }
                              }
                              if (!flagForinsideRouteScreenFound) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Container(
                                    child:
                                        Text('Route Is Already Being Shared'),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  elevation: 0,
                                ));
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 3"),
                        onPressed: () async {
                          var db = FirebaseFirestore.instance;
                          db
                              .collection("isUsing")
                              .where('insideRouteScreen', isEqualTo: false)
                              .get()
                              .then(
                            (querySnapshot) {
                              for (var docSnapshot in querySnapshot.docs) {
                                if (docSnapshot.id == 'index3') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TeacherLocationSharing3()));
                                  _updateInsideRouteScreen3();
                                  flagForinsideRouteScreenFound = true;
                                  break;
                                }
                              }
                              if (!flagForinsideRouteScreenFound) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Container(
                                    child:
                                        Text('Route Is Already Being Shared'),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  elevation: 0,
                                ));
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 4"),
                        onPressed: () async {
                          var db = FirebaseFirestore.instance;
                          db
                              .collection("isUsing")
                              .where('insideRouteScreen', isEqualTo: false)
                              .get()
                              .then(
                            (querySnapshot) {
                              for (var docSnapshot in querySnapshot.docs) {
                                if (docSnapshot.id == 'index4') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TeacherLocationSharing4()));
                                  _updateInsideRouteScreen4();
                                  flagForinsideRouteScreenFound = true;
                                  break;
                                }
                              }
                              if (!flagForinsideRouteScreenFound) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Container(
                                    child:
                                        Text('Route Is Already Being Shared'),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  elevation: 0,
                                ));
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 5"),
                        onPressed: () async {
                          var db = FirebaseFirestore.instance;
                          db
                              .collection("isUsing")
                              .where('insideRouteScreen', isEqualTo: false)
                              .get()
                              .then(
                            (querySnapshot) {
                              for (var docSnapshot in querySnapshot.docs) {
                                if (docSnapshot.id == 'index5') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TeacherLocationSharing5()));
                                  _updateInsideRouteScreen5();
                                  flagForinsideRouteScreenFound = true;
                                  break;
                                }
                              }
                              if (!flagForinsideRouteScreenFound) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Container(
                                    child:
                                        Text('Route Is Already Being Shared'),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  elevation: 0,
                                ));
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 6"),
                        onPressed: () async {
                          var db = FirebaseFirestore.instance;
                          db
                              .collection("isUsing")
                              .where('insideRouteScreen', isEqualTo: false)
                              .get()
                              .then(
                            (querySnapshot) {
                              for (var docSnapshot in querySnapshot.docs) {
                                if (docSnapshot.id == 'index6') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TeacherLocationSharing6()));
                                  _updateInsideRouteScreen6();
                                  flagForinsideRouteScreenFound = true;
                                  break;
                                }
                              }
                              if (!flagForinsideRouteScreenFound) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Container(
                                    child:
                                        Text('Route Is Already Being Shared'),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  elevation: 0,
                                ));
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 7"),
                        onPressed: () async {
                          var db = FirebaseFirestore.instance;
                          db
                              .collection("isUsing")
                              .where('insideRouteScreen7', isEqualTo: false)
                              .get()
                              .then(
                            (querySnapshot) {
                              for (var docSnapshot in querySnapshot.docs) {
                                if (docSnapshot.id == 'index7') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TeacherLocationSharing7()));
                                  _updateInsideRouteScreen7();
                                  flagForinsideRouteScreenFound = true;
                                  break;
                                }
                              }
                              if (!flagForinsideRouteScreenFound) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Container(
                                    child:
                                        Text('Route Is Already Being Shared'),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  elevation: 0,
                                ));
                              }
                            },
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
                        onPressed: () async {
                          var db = FirebaseFirestore.instance;
                          db
                              .collection("isUsing")
                              .where('insideRouteScreen', isEqualTo: false)
                              .get()
                              .then(
                            (querySnapshot) {
                              for (var docSnapshot in querySnapshot.docs) {
                                if (docSnapshot.id == 'index8') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TeacherLocationSharing8()));
                                  _updateInsideRouteScreen8();
                                  flagForinsideRouteScreenFound = true;
                                  break;
                                }
                              }
                              if (!flagForinsideRouteScreenFound) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Container(
                                    child:
                                        Text('Route Is Already Being Shared'),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  elevation: 0,
                                ));
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 9"),
                        onPressed: () async {
                          var db = FirebaseFirestore.instance;
                          db
                              .collection("isUsing")
                              .where('insideRouteScreen', isEqualTo: false)
                              .get()
                              .then(
                            (querySnapshot) {
                              for (var docSnapshot in querySnapshot.docs) {
                                if (docSnapshot.id == 'index9') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TeacherLocationSharing9()));
                                  _updateInsideRouteScreen9();
                                  flagForinsideRouteScreenFound = true;
                                  break;
                                }
                              }
                              if (!flagForinsideRouteScreenFound) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Container(
                                    child:
                                        Text('Route Is Already Being Shared'),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  elevation: 0,
                                ));
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 10"),
                        onPressed: () async {
                          var db = FirebaseFirestore.instance;
                          db
                              .collection("isUsing")
                              .where('insideRouteScreen', isEqualTo: false)
                              .get()
                              .then(
                            (querySnapshot) {
                              for (var docSnapshot in querySnapshot.docs) {
                                if (docSnapshot.id == 'index10') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TeacherLocationSharing10()));
                                  _updateInsideRouteScreen10();
                                  flagForinsideRouteScreenFound = true;
                                  break;
                                }
                              }
                              if (!flagForinsideRouteScreenFound) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Container(
                                    child:
                                        Text('Route Is Already Being Shared'),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  elevation: 0,
                                ));
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 11"),
                        onPressed: () async {
                          var db = FirebaseFirestore.instance;
                          db
                              .collection("isUsing")
                              .where('insideRouteScreen', isEqualTo: false)
                              .get()
                              .then(
                            (querySnapshot) {
                              for (var docSnapshot in querySnapshot.docs) {
                                if (docSnapshot.id == 'index11') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TeacherLocationSharing11()));
                                  _updateInsideRouteScreen11();
                                  flagForinsideRouteScreenFound = true;
                                  break;
                                }
                              }
                              if (!flagForinsideRouteScreenFound) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Container(
                                    child:
                                        Text('Route Is Already Being Shared'),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  elevation: 0,
                                ));
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 12"),
                        onPressed: () async {
                          var db = FirebaseFirestore.instance;
                          db
                              .collection("isUsing")
                              .where('insideRouteScreen', isEqualTo: false)
                              .get()
                              .then(
                            (querySnapshot) {
                              for (var docSnapshot in querySnapshot.docs) {
                                if (docSnapshot.id == 'index12') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TeacherLocationSharing12()));
                                  _updateInsideRouteScreen12();
                                  flagForinsideRouteScreenFound = true;
                                  break;
                                }
                              }
                              if (!flagForinsideRouteScreenFound) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Container(
                                    child:
                                        Text('Route Is Already Being Shared'),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  elevation: 0,
                                ));
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 13"),
                        onPressed: () async {
                          var db = FirebaseFirestore.instance;
                          db
                              .collection("isUsing")
                              .where('insideRouteScreen', isEqualTo: false)
                              .get()
                              .then(
                            (querySnapshot) {
                              for (var docSnapshot in querySnapshot.docs) {
                                if (docSnapshot.id == 'index13') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TeacherLocationSharing13()));
                                  _updateInsideRouteScreen13();
                                  flagForinsideRouteScreenFound = true;
                                  break;
                                }
                              }
                              if (!flagForinsideRouteScreenFound) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Container(
                                    child:
                                        Text('Route Is Already Being Shared'),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  elevation: 0,
                                ));
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        child: const Text("Route 14"),
                        onPressed: () async {
                          var db = FirebaseFirestore.instance;
                          db
                              .collection("isUsing")
                              .where('insideRouteScreen', isEqualTo: false)
                              .get()
                              .then(
                            (querySnapshot) {
                              for (var docSnapshot in querySnapshot.docs) {
                                if (docSnapshot.id == 'index144') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TeacherLocationSharing14()));
                                  _updateInsideRouteScreen14();
                                  flagForinsideRouteScreenFound = true;
                                  break;
                                }
                              }
                              if (!flagForinsideRouteScreenFound) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Container(
                                    child:
                                        Text('Route Is Already Being Shared'),
                                  ),
                                  behavior: SnackBarBehavior.floating,
                                  elevation: 0,
                                ));
                              }
                            },
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

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mao/OrderTrackingPage1.dart';
import 'package:location/location.dart' as loc;
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';

class TeacherLocationSharing extends StatefulWidget {
  const TeacherLocationSharing({super.key});

  @override
  TeacherLocationSharingOveride createState() =>
      TeacherLocationSharingOveride();
}

class TeacherLocationSharingOveride extends State<TeacherLocationSharing> {
  final loc.Location location = loc.Location();
  bool canExit = true;
  StreamSubscription<loc.LocationData>? _locationSubscription;

  @override
  void initState() {
    super.initState();

    _requestPermission();
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Selection Page"),
          centerTitle: true,
        ),
        body: Column(children: [
          TextButton(
              onPressed: () {
                _listenLocation();
              },
              child: const Text('Enable Live Sharing')),
          TextButton(
              onPressed: () {
                _stopListening();
              },
              child: const Text('Stop Live Sharing')),
          Expanded(
              child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('location').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return WillPopScope(
                  onWillPop: _onPop,
                  child: ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title:
                            Text(snapshot.data!.docs[index]['name'].toString()),
                        subtitle: Row(
                          children: [
                            Text(snapshot.data!.docs[index]['latitude']
                                .toString()),
                            const SizedBox(
                              width: 20,
                            ),
                            Text(snapshot.data!.docs[index]['longitude']
                                .toString())
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.directions),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OrderTrackingPage(
                                    snapshot.data!.docs[index].id)));
                          },
                        ),
                      );
                    },
                  ));
            },
          ))
        ]),
      );

  _getLocation() async {
    //make if loop here using if button pressed and add routes here
    try {
      final loc.LocationData locationResult = await location.getLocation();
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitude': locationResult.latitude,
        'longitude': locationResult.longitude,
        'name': 'Route:1'
      }, SetOptions(merge: true));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _listenLocation() async {
    setState(() {
      canExit = false;
    });
    _locationSubscription = location.onLocationChanged.handleError((onError) {
      print(onError);
      _locationSubscription?.cancel();
      setState(() {
        _locationSubscription = null;
      });
    }).listen((loc.LocationData currentLocation) async {
      await FirebaseFirestore.instance.collection('location').doc('user1').set({
        'latitude': currentLocation.latitude,
        'longitude': currentLocation.longitude,
        'name': 'Route:1'
      }, SetOptions(merge: true));
    });
  }

  _stopListening() {
    _locationSubscription?.cancel();
    setState(() {
      _locationSubscription = null;
      canExit = true;
    });
  }

  _requestPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      _requestPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  Future<bool> _onPop() async {
    if (canExit == false) {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Are you sure?'),
              content: const Text('Stop Sharing Bus Location & Exit'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  //<-- SEE HERE
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () {
                    _stopListening();
                    _updateInsideRouteScreen();
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('Yes'),
                ),
              ],
            ),
          )) ??
          false;
    } else {
      _updateInsideRouteScreen();
      return true;
    }
  }

  Future<void> _updateInsideRouteScreen() async {
    await FirebaseFirestore.instance
        .collection("isUsing")
        .doc('index1')
        .update({
      'insideRouteScreen': false,
    });
  }
}

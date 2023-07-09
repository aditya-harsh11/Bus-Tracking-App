import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_mao/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class studentView extends StatefulWidget {
  const studentView({super.key});

  @override
  State<studentView> createState() => studentviewState();
}

class studentviewState extends State<studentView> {
  final Completer<GoogleMapController> _controller = Completer();

  var longi;
  var lati;

  late GoogleMapController upperController;
  static const LatLng sourceLocation = LatLng(13.0032, 77.5824);
  static const LatLng destination =
      LatLng(13.101733400175208, 77.58373978219565);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  bool _added = false;

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor DestinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  void getCurrentLocation() {
    Location location = Location();
    location.getLocation().then((location) {
      currentLocation = location;
    });

    location.onLocationChanged.listen(
      (newLoc) {
        currentLocation = newLoc;
        setState(() {});
      },
    );
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      setState(() {});
    }
  }

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/Pin_source.png")
        .then((icon) {
      sourceIcon = icon;
    });

    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/Pin_destination.png")
        .then((icon) {
      DestinationIcon = icon;
    });

    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/Badge.png")
        .then((icon) {
      currentLocationIcon = icon;
    });
  }

  @override
  void initState() {
    getLatitude();
    getLongitude();
    getCurrentLocation();
    setCustomMarkerIcon();
    getPolyPoints();
    super.initState();
  }

  @override
  build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Track order",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
        body: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('location').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData || longi == null || lati == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return GoogleMap(
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                initialCameraPosition:
                    CameraPosition(target: LatLng(lati, longi), zoom: 14.47),
                zoomControlsEnabled: true,
                onMapCreated: (GoogleMapController controller) async {
                  setState(() {
                    upperController = controller;
                    _added = true;
                  });
                },
                polylines: {
                  Polyline(
                    polylineId: const PolylineId("route"),
                    points: polylineCoordinates,
                    color: primaryColor,
                    width: 6,
                  )
                },
                markers: {
                  Marker(
                    markerId: const MarkerId("source"),
                    icon: currentLocationIcon,
                    position: sourceLocation,
                  ),
                  Marker(
                    markerId: const MarkerId("destination"),
                    icon: DestinationIcon,
                    position: destination,
                  ),
                  Marker(
                      markerId: const MarkerId('BusLocation'),
                      icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueMagenta),
                      position: LatLng(lati, longi))
                },
              );
            }));
  }

  Future<void> mapChanger(AsyncSnapshot<QuerySnapshot> snapshot) async {
    await upperController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lati, longi), zoom: 14.47)));
  }

  getLongitude() async {
    var db = FirebaseFirestore.instance;
    final docRef = db.collection('location').doc('user1');
    docRef.snapshots().listen((event) async => await db
            .collection("location")
            .where('finder', isEqualTo: true)
            .get()
            .then((querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            if (docSnapshot.id == 'user1') {
              longi = docSnapshot.data()['longitude'];
            }
          }
        }));
  }

  getLatitude() async {
    var ab = FirebaseFirestore.instance;
    final docRef = ab.collection('location').doc('user1');
    docRef.snapshots().listen((event) async => await ab
            .collection("location")
            .where('finder', isEqualTo: true)
            .get()
            .then((querySnapshot) {
          for (var docSnapshot in querySnapshot.docs) {
            if (docSnapshot.id == 'user1') {
              lati = docSnapshot.data()['latitude'];
            }
          }
        }));
  }
}

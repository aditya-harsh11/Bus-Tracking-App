import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_mao/constants.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' ; 

class OrderTrackingPage extends StatefulWidget {
  final String user_id ; // Intial Defualt Value (Might Be the wrong solution)
  OrderTrackingPage(this.user_id);
   // const OrderTrackingPage({Key? key}) : super(key: key); # IDK what this does , If something doesnt work try uncommenting
  @override
  State<OrderTrackingPage> createState() => OrderTrackingPageState();
}

class OrderTrackingPageState extends State<OrderTrackingPage> {
  final Completer<GoogleMapController> _controller = Completer();
  late  GoogleMapController upperController;
  static const LatLng sourceLocation = LatLng(12.997216660253093, 77.57941368343165); 
  static const LatLng destination = LatLng(13.101733400175208, 77.58373978219565);

List <LatLng> polylineCoordinates = [];
LocationData? currentLocation;

  bool _added = false;

BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
BitmapDescriptor DestinationIcon = BitmapDescriptor.defaultMarker;
BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;  


void getCurrentLocation(){ //Current Phone Location (Use there InCase , We need the buses location not this)

  Location location = Location();
  location.getLocation().then(
    (location){

      currentLocation = location;

    }
    );

    location.onLocationChanged.listen(
      (newLoc) {
        currentLocation = newLoc;
        setState(() {
          
        });
    },
    );

}

  void getPolyPoints() async { 

    PolylinePoints polylinePoints = PolylinePoints();
    
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(google_api_key, 
    PointLatLng(sourceLocation.latitude, sourceLocation.longitude), 
    PointLatLng(destination.latitude, destination.longitude),
    );

    if (result.points.isNotEmpty){

      result.points.forEach((PointLatLng point) => polylineCoordinates.add(LatLng(point.latitude, point.longitude)) 
      );
      setState(() {});
    }
  }


void setCustomMarkerIcon(){

  BitmapDescriptor.fromAssetImage(
    ImageConfiguration.empty,"assets/Pin_source.png").then(
      (icon){
        sourceIcon = icon;
      }
      
      );

      BitmapDescriptor.fromAssetImage(
    ImageConfiguration.empty,"assets/Pin_destination.png").then(
      (icon){
        DestinationIcon = icon;
      }
      
      );

      BitmapDescriptor.fromAssetImage(
    ImageConfiguration.empty,"assets/Badge.png").then(
      (icon){
        currentLocationIcon = icon;
      }
      
      );
}
  @override
  void initState(){
    getCurrentLocation();
    setCustomMarkerIcon();
    getPolyPoints();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Track order",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: StreamBuilder (
        stream: FirebaseFirestore.instance.collection('location').snapshots(),
     // currentLocation == null ?  const Center(child: Text("Loading")) #Not needed as we are not getting the location of the Phone 
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
      if(!snapshot.hasData){
           return Center(child: CircularProgressIndicator());
      } 
      return 
       GoogleMap(
      mapType: MapType.normal,
      zoomGesturesEnabled: true,
      initialCameraPosition: 
      CameraPosition(
        target: LatLng(snapshot.data!.docs.singleWhere((element) => element.id == widget.user_id)['latitude'],
                      snapshot.data!.docs.singleWhere((element) =>  element.id == widget.user_id)['longitude']),
                       zoom: 14.47
                      ),
       
         
        
        
      zoomControlsEnabled: true,
      onMapCreated: (GoogleMapController controller) async{
          setState(() {
            upperController = controller;
            _added = true;
          });
      }, 
        polylines: {

          Polyline(polylineId: const PolylineId("route"),
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
            icon:DestinationIcon,
            position: destination,
          ),
          /* Marker(
            markerId: const MarkerId("PhonecurrentLocation"),
            icon:currentLocationIcon,
    
            position: LatLng(
              currentLocation!.latitude! , currentLocation!.longitude!),
            ),
            */
         

          Marker(
            markerId: const MarkerId('BusLocation'),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
             position: LatLng(
              snapshot.data!.docs.singleWhere((element) => element.id == widget.user_id)['latitude'],
                      snapshot.data!.docs.singleWhere((element) =>  element.id == widget.user_id)['longitude']
             )
          )

        },
      );
  } // Async Builder END
  )
    );
  }
  Future<void> mapChanger(AsyncSnapshot<QuerySnapshot> snapshot) async{

    await upperController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: 
    LatLng(
      snapshot.data!.docs.singleWhere((element) => element.id == widget.user_id)['latitude'],
                      snapshot.data!.docs.singleWhere((element) =>  element.id == widget.user_id)['longitude']
    ),
    zoom: 14.47
    ))
    );
  }
}

import 'dart:async';
import 'package:fast_aid/constants/Color-Constants.dart';
import 'package:fast_aid/constants/Style-Constants.dart';
import 'package:fast_aid/custom-widgets/Custom-Drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Position riderPosition;
  Future<void> _goToUserPosition() async {
    final GoogleMapController controller = await _controller.future;
    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    riderPosition = currentPosition;
    LatLng pos = LatLng(currentPosition.latitude, currentPosition.longitude);
    CameraPosition currentCP = new CameraPosition(target: pos, zoom: 14);
    controller.animateCamera(CameraUpdate.newCameraPosition(currentCP));
    //startGeofireListener();
  }

  void getUserCurrentLocation() async {
    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    riderPosition = currentPosition;
    LatLng pos = LatLng(currentPosition.latitude, currentPosition.longitude);
    CameraPosition currentCP = new CameraPosition(target: pos, zoom: 14);
    mapController.animateCamera(CameraUpdate.newCameraPosition(currentCP));
    //startGeofireListener();
  }

  void startGeofireListener() {
    print('HI out');
    Geofire.initialize('fast-aid-2392c-default-rtdb/data/driversAvailable');
    Geofire.queryAtLocation(riderPosition.latitude, riderPosition.longitude, 5)
        .listen((map) {
      print('Hi');
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            zoomControlsEnabled: false,
            initialCameraPosition: _kGooglePlex,
            mapType: MapType.normal,
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              mapController = controller;
              getUserCurrentLocation();
            },
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 35, 0, 0),
            child: ElevatedButton(
                onPressed: () {
                  _scaffoldKey.currentState.openDrawer();
                },
                child: Icon(Icons.menu),
                style: kDrawerButtonStyle),
          ),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          elevation: 10,
          backgroundColor: kImperialRed,
          mini: true,
          onPressed: () {
            _goToUserPosition();
          },
          child: Icon(Icons.my_location),
        ),
      ),
    );
  }
}

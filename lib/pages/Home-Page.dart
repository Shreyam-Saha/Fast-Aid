import 'dart:async';
import 'package:fast_aid/constants/Color-Constants.dart';
import 'package:fast_aid/constants/Style-Constants.dart';
import 'package:fast_aid/custom-widgets/Custom-Dialog.dart';
import 'package:fast_aid/custom-widgets/Custom-Drawer.dart';
import 'package:fast_aid/data-models/nearbyDrivers.dart';
import 'package:fast_aid/data/nearbyDriverData.dart';
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
  Set<Marker> _mapMarkers = {};
  BitmapDescriptor driverIcon;

  void createMarker() {
    if (driverIcon == null) {
      ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context, size: Size(2, 2));
      BitmapDescriptor.fromAssetImage(
              imageConfiguration, 'assets/images/car_android.png')
          .then((icon) {
        driverIcon = icon;
      });
    }
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Position riderPosition;
  void getUserCurrentLocation() async {
    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    riderPosition = currentPosition;
    LatLng pos = LatLng(currentPosition.latitude, currentPosition.longitude);
    CameraPosition currentCP = new CameraPosition(target: pos, zoom: 14);
    mapController.animateCamera(CameraUpdate.newCameraPosition(currentCP));
    //startGeofireListener();
    showNearbyDriverMarkers();
  }

  void startGeofireListener() {
    Geofire.initialize('fast-aid-2392c-default-rtdb/data/driversAvailable');
    Geofire.queryAtLocation(riderPosition.latitude, riderPosition.longitude, 5)
        .listen((map) {
      print(map);
    });
  }

  void showNearbyDriverMarkers() {
    Set<Marker> nearByDriverMarkers = new Set<Marker>();
    for (NearbyDriver driver in nearbyDriversList) {
      LatLng driverPos = LatLng(driver.latitude, driver.longitude);
      Marker thisMarker = Marker(
          markerId: MarkerId('driver${driver.key}'),
          position: driverPos,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          rotation: 0);
      nearByDriverMarkers.add(thisMarker);
      setState(() {
        _mapMarkers = nearByDriverMarkers;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    createMarker();
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            markers: _mapMarkers,
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.fromLTRB(10, 0, 20, 12),
                width: 220,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kImperialRed),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                  ),
                  onPressed: () async {
                    await showModalBottomSheet(
                      isDismissible: true,
                      context: context,
                      builder: (BuildContext context) => CustomDialog(
                        title: 'Request an Ambulance',
                        subTitle:
                            'You are about to initiate a emergency request. Are you sure ?',
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Request an Ambulance',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
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
            getUserCurrentLocation();
          },
          child: Icon(Icons.my_location),
        ),
      ),
    );
  }
}

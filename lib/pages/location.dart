import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyLocation extends StatefulWidget {
  @override
  _MyLocationState createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {

  bool isLoading = false;

  Position position = Position();

  @override
  void initState() {
    super.initState();
    openLocationService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: isLoading ? map() : Center(child: CircularProgressIndicator(),),
      ),
    );
  }

  getLocation() async{
    var current = await Geolocator().getCurrentPosition();
    setState(() {
      position = current;
      isLoading = true;
    });
  }

  openLocationService() async {
    bool service = await Geolocator().isLocationServiceEnabled();
    if (!service) {
      showDialog(
          context: context,
        barrierDismissible: true,
        builder: (BuildContext context){
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              backgroundColor: Colors.white,
              title: Text('Attention'),
              content: Text('Enable Location service'),
              actions: <Widget>[
                FlatButton(
                  onPressed: (){
                    Navigator.pop(context);
                    setState(() {
                      getLocation();
                    });
                  },
                  child: Text('OK'),
                )
              ],
            );
        }
      );
    }else {
      getLocation();
    }
  }

  map() =>
      GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 12
        ),
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        mapType: MapType.normal,
      );
}

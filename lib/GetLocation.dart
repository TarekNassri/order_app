import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';


class GetLocation extends StatefulWidget {
  const GetLocation({Key? key}) : super(key: key);

  @override
  GetLocation1 createState() => GetLocation1();
}

class GetLocation1 extends State<GetLocation> {
  late TextEditingController x ;
  late TextEditingController y ;
  late TextEditingController z ;
  String location ='Null, Press Button';
  String Address = 'search';

  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position,TextEditingController x , TextEditingController y , TextEditingController z)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    x.text = '${place.street}';
    y.text = '${place.postalCode}';
    z.text = '${place.locality}';


    Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(()  {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Coordinates Points',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text(location,style: TextStyle(color: Colors.black,fontSize: 16),),
            SizedBox(height: 10,),
            Text('ADDRESS',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text('${Address}'),
            ElevatedButton(onPressed: () async{
              Position position = await getGeoLocationPosition();
              location ='Lat: ${position.latitude} , Long: ${position.longitude}';
              GetAddressFromLatLong(position,x,y,z);
            }, child: Text('Get Location'))
          ],
        ),
      ),
    );
  }
}


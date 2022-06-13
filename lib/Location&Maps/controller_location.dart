import 'package:carpooling_app/Location&Maps/locationUser.dart';
import 'package:carpooling_app/SharedPrefrances/sherdprefrances.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

class ControllerLocation {
  Location location = Location();
  late LocationData _locationData;

  Future<bool> checkLocationServes() async {
    bool _resultCheckGps;
    // تفحص وتطلب اذن من التطبيق باسماح بتشغيل الGPS

    _resultCheckGps = await location.serviceEnabled();
    if (_resultCheckGps) {
      chekLocation();

      await ShController().checkGps(gps: _resultCheckGps);
    } else {
      _resultCheckGps = await location.requestService();
      if (_resultCheckGps) {
        chekLocation();

        await ShController().checkGps(gps: _resultCheckGps);
      } else {
        SystemNavigator.pop();
      }
    }
    return ShController().returnGpsChecked;
  }

  // تشييك على حالة الGPS

  Future<void> chekLocation() async {
    PermissionStatus permissionGranted;

    permissionGranted = await location.hasPermission();

    if (permissionGranted == PermissionStatus.granted) {
      getLocation();
    } else {
      permissionGranted = await location.requestPermission();
      if (permissionGranted == PermissionStatus.granted) {
        getLocation();
      } else {
        SystemNavigator.pop();
      }
    }
  }

  Future<void> getLocation() async {
    LocationUser locationUser;
    _locationData = await location.getLocation();
    double? latitude = _locationData.latitude?.toDouble();
    double? longitude = _locationData.longitude?.toDouble();
    ShController().saveLocationUser(latitude: latitude!, longitude: longitude!);
    // return locationUser =
    //     LocationUser(latitude: latitude!, longitude: longitude!);
  }
}

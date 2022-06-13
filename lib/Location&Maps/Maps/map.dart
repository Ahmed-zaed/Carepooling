
import 'package:carpooling_app/Mixin/Helper.dart';
import 'package:carpooling_app/SharedPrefrances/sherdprefrances.dart';
import 'package:carpooling_app/Widget/textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({Key? key, this.option}) : super(key: key);
  final int? option;

  @override
  State<Map> createState() => _MapState();
}

String? error;
late TextEditingController _textEditingController;

class _MapState extends State<Map> with Helper {
  late GoogleMapController googleMapController;

  late double? latitude;
  late double? longitude;
  int markerCheck = 0;
  String? errorText;

  //بيرجع اوبجكت من mapعند انتهاء التحميل

  Set<Marker> marker = <Marker>{};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    latitude = ShController().returnLatitude;
    longitude = ShController().returnLongitude;
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          height: 48,
          child: Stack(
            children: [
              TextFiledWidget(
                  controller: _textEditingController,
                  hintText: 'Search',
                  icon: IconButton(
                      onPressed: () {
                        serchaddress();
                      },
                      icon: const Icon(Icons.my_location)),
                  errorText: errorText,
                  keyboardType: TextInputType.text),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(latitude!, longitude!),
              zoom: 15,
            ),
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                googleMapController = controller;
              });
            },
            markers: marker,
            onTap: (LatLng latLng) {
              Marker _marker = Marker(
                markerId: MarkerId('Marker${marker.length}'),
                infoWindow: const InfoWindow(title: 'Start Trip'),
                position: latLng,
                visible: true,
              );
              setState(() {
                marker.add(_marker);
                latitude = latLng.latitude;
                longitude = latLng.longitude;
                markerCheck = 1;
              });
            },
          ),
          Positioned(
            child: ElevatedButton(
              onPressed: () {

                chek();
              },
              child: const Text(
                'Add Address',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50), primary: Colors.green),
            ),
            bottom: 50,
            left: 100,
          ),
        ],
      ),
    );
  }

  void serchaddress() async {
    var t = await Geocoder.local
        .findAddressesFromQuery(_textEditingController.text);
    if (latitude == null) {
      setState(() {
        latitude = ShController().returnLatitudeStart;
      });
    } else if (longitude == null) {
      setState(() {
        longitude = ShController().returnLongitudeStart;
      });
    } else {
      setState(() {
        latitude = t.first.coordinates.latitude?.toDouble();
        longitude = t.first.coordinates.longitude?.toDouble();
      });
    }
    setState(() {
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(latitude!, longitude!), zoom: 16),
        ),
      );
    });
  }

  void chek() {
    if (_textEditingController.text.isEmpty) {
      showSnackBare(context,
          message:
              'You must write the name of the city and add a point on the map in order to be accurately determined',
          visibility: true);
    } else if (markerCheck == 0) {
      showSnackBare(context,
          message:
              'You must write the name of the city and add a point on the map in order to be accurately determined',
          visibility: true);
    } else {
      showSnackBare(context,
          message: 'The area is selected as a starting point',
          visibility: false);
      widget.option == 0
          ? ShController().saveAddress(
          startAddress: _textEditingController.text,
          endAddress: ShController().returnEndAddress)
          : widget.option == 1
          ? ShController().saveAddress(
          startAddress: ShController().returnStartAddress,
          endAddress: _textEditingController.text)
          : '0';
      widget.option == 0
          ? ShController().saveStartLanLong(
          latitudeStart: latitude!, longitudeStart: longitude!)
          : widget.option == 1
          ? ShController().saveEndLanLong(
          latitudeEnd: latitude!, longitudeEnd: longitude!)
          : 0;
      Navigator.pop(
        context,
      );
    }
  }
}

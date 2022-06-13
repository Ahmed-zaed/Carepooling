import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class ShowLocationTrip extends StatefulWidget {
  const ShowLocationTrip(
      {Key? key,
      required this.startLatitude,
      required this.endLatitude,
      required this.startLongitude,
      required this.endLongitude})
      : super(key: key);
  final double startLatitude;
  final double endLatitude;
  final double startLongitude;
  final double endLongitude;

  @override
  State<ShowLocationTrip> createState() => _ShowLocationTripState();
}

class _ShowLocationTripState extends State<ShowLocationTrip> {
  final Completer<GoogleMapController> _controller = Completer();

  Set<Polyline> polyline = Set<Polyline>();
  List<LatLng> list = <LatLng>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.startLatitude, widget.startLongitude),
          zoom: 14,
        ),
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            _controller.complete(controller);
            polylines();
          });
        },
        polylines: polyline,
        markers: <Marker>{
          Marker(
              markerId: const MarkerId('start'),
              icon: BitmapDescriptor.defaultMarkerWithHue(90),
              position: LatLng(widget.startLatitude, widget.startLongitude),
              infoWindow: const InfoWindow(
                  title: 'Start Trip',
                  snippet: 'You will start your journey from here')),
          Marker(
            markerId: const MarkerId('end'),
            position: LatLng(widget.endLatitude, widget.endLongitude),
            infoWindow: const InfoWindow(
                title: 'End Trip', snippet: 'Your journey ends here'),
          ),
        },
      ),
    );
  }

  void polylines() {
    setState(() {
      polyline.add(
        Polyline(width: 3, polylineId: const PolylineId('1'), points: [
          LatLng(widget.startLatitude, widget.startLongitude),
          LatLng(widget.endLatitude, widget.endLongitude),
        ]),
      );
    });
  }
}

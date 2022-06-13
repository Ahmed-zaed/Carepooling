import 'package:carpooling_app/Model/bottomnavigator.dart';
import 'package:carpooling_app/Passenger/NavigatorScreen_Passenger/collection.dart';
import 'package:carpooling_app/Passenger/NavigatorScreen_Passenger/home.dart';
import 'package:carpooling_app/Passenger/NavigatorScreen_Passenger/profile.dart';
import 'package:carpooling_app/Passenger/NavigatorScreen_Passenger/trip.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreenPassenger extends StatefulWidget {
  const HomeScreenPassenger({Key? key}) : super(key: key);

  @override
  State<HomeScreenPassenger> createState() => _HomeScreenPassengerState();
}

class _HomeScreenPassengerState extends State<HomeScreenPassenger> {
  int currentIndex = 0;

  final List<BtNavigator> _list = <BtNavigator>[
    const BtNavigator(title: 'Home', widget: HomePassenger()),
    const BtNavigator(title: 'Collection', widget: CollectionScreenPassenger()),
    const BtNavigator(title: 'Trips', widget: TripPassenger()),
    const BtNavigator(title: 'Profile', widget: ProfilePassengerScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Align(
            child: Text(
              _list[currentIndex].title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            alignment: AlignmentDirectional.bottomCenter,
          ),
        ),
      ),
      body: _list[currentIndex].widget,

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.redAccent,
        height: 55,
        color: const Color(0xffB40000),
        items: const <Widget>[
          Icon(Icons.home, color: Colors.white, size: 26),
          Icon(Icons.phone_android, color: Colors.white, size: 26),
          Icon(Icons.directions_car, color: Colors.white, size: 26),
          Icon(Icons.person, color: Colors.white, size: 26),
        ],
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        animationCurve: Curves.ease,
        index: 0,
      ),
    );
  }
}

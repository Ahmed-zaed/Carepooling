import 'package:carpooling_app/Componentes/applocal.dart';
import 'package:carpooling_app/Model/bottomnavigator.dart';
import 'package:carpooling_app/Model/joiningpassenger.dart';
import 'package:carpooling_app/Screens/NavigatorScreen/collection.dart';
import 'package:carpooling_app/Screens/NavigatorScreen/profile.dart';
import 'package:carpooling_app/Screens/NavigatorScreen/trip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../Controller/Firebase/firestore.dart';
import 'NavigatorScreen/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  late int notifications = 0;
  late int not;
  late String home;

  final List<BtNavigator> _list = <BtNavigator>[
    const BtNavigator(title: 'Home', widget: Home()),
    const BtNavigator(title: 'Collection', widget: CollectionScreen()),
    const BtNavigator(title: 'Trips', widget: Trip()),
    const BtNavigator(title: 'Profile', widget: ProfileScreen()),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Visibility(
          visible: currentIndex == 0 ? true : false,
          child: Stack(
            children: [
              const SizedBox(
                width: 50,
                height: 40,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    notifications = 0;
                  });
                  Navigator.pushNamed(context, '/Notification');
                },
                icon: const Icon(
                  Icons.add_alert_sharp,
                  color: Colors.black,
                ),
              ),
              StreamBuilder<QuerySnapshot<JoiningPassenger>>(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    for (int i = 0; i < snapshot.data!.docs.length; i++) {
                      if (snapshot.data!.docs[i].data().condetion == 0) {
                        notifications = 1;
                      }
                    }

                    return Visibility(
                      visible: notifications == 0 ? false : true,
                      child: const Positioned(
                        child: Text(
                          '*',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        left: 35,
                        bottom: 10,
                      ),
                    );
                  }
                  return const Text('');
                },
                stream: FireStore().readNotifications(),
              ),
            ],
          ),
        ),
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

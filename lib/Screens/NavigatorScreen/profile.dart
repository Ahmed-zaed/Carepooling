import 'package:carpooling_app/Controller/Firebase/firestore.dart';
import 'package:carpooling_app/Model/users.dart';
import 'package:carpooling_app/Screens/editeProfiledriver.dart';
import 'package:carpooling_app/SharedPrefrances/sherdprefrances.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Widget/listtile_widgete.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {
  late String name;
  late String phone;
  late String email;
  late String city;
  late String car;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: StreamBuilder<DocumentSnapshot<Users>>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView(
              padding: const EdgeInsets.symmetric(vertical: 10),
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                    ),
                    const Center(
                      child: CircleAvatar(
                        backgroundColor: Color(0xffEF9A9A),
                        radius: 80,
                        backgroundImage: AssetImage('images/khareta.jpg'),
                      ),
                    ),
                    Positioned(
                      child: CircleAvatar(

                        radius: 23,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfileDriver(
                                    name: snapshot.data!.data()!.name,
                                    car: snapshot.data!.data()!.car,
                                    phone: snapshot.data!.data()!.phone,
                                    email: snapshot.data!.data()!.email,
                                    city: snapshot.data!.data()!.location),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.drive_file_rename_outline,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      right: 89,
                      bottom: 50,
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.red,
                ),
                const SizedBox(
                  height: 10,
                ),
                LitTile(
                    title: snapshot.data!.data()!.name,
                    supTitle: '',
                    icon: const Icon(Icons.person)),
                LitTile(
                    title: snapshot.data!.data()!.email,
                    supTitle: AppLocalizations.of(context)!.email,
                    icon: const Icon(Icons.email)),
                LitTile(
                    title: snapshot.data!.data()!.phone,
                    supTitle:AppLocalizations.of(context)!.mobile,
                    icon: const Icon(Icons.phone_android)),
                LitTile(
                    title: snapshot.data!.data()!.location,
                    supTitle: AppLocalizations.of(context)!.city,
                    icon: const Icon(Icons.location_on)),
                LitTile(
                    title: snapshot.data!.data()!.car,
                    supTitle: AppLocalizations.of(context)!.car,
                    icon: const Icon(Icons.directions_car)),
              ],
            );
          }
          return const Center(
            child: Text('error'),
          );
        },
        stream: FireStore().readDriver(),
      ),
    );
  }
}
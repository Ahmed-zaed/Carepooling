
import 'package:carpooling_app/Controller/Firebase/firestore.dart';
import 'package:carpooling_app/Model/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Widget/listtile_widgete.dart';


class ProfileDriverTrips extends StatefulWidget {
  const ProfileDriverTrips({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  State<ProfileDriverTrips> createState() => _ProfileDriverTripsState();
}

late String name;
late String phone;
late String email;
late String city;
late String car;

class _ProfileDriverTripsState extends State<ProfileDriverTrips> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Profile Driver'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                    ],
                  ),
                  const Divider(
                    color: Colors.red,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  LitTile(
                      title: snapshot.data!.data()!.name.toString(),
                      supTitle: '',
                      icon: const Icon(Icons.person)),
                  LitTile(
                      title: snapshot.data!.data()!.email,
                      supTitle: AppLocalizations.of(context)!.email,
                      icon: const Icon(Icons.email)),
                  LitTile(
                      title: snapshot.data!.data()!.phone,
                      supTitle:  AppLocalizations.of(context)!.mobile,
                      icon: const Icon(Icons.phone_android)),
                  LitTile(
                      title: snapshot.data!.data()!.location,
                      supTitle:  AppLocalizations.of(context)!.city,
                      icon: const Icon(Icons.location_on)),
                  LitTile(
                      title: snapshot.data!.data()!.car,
                      supTitle: AppLocalizations.of(context)!.car,
                      icon: const Icon(Icons.directions_car)),
                ],
              );
            }
            return  Center(
              child: Text(AppLocalizations.of(context)!.no_data),
            );
          },
          stream: FireStore().profileSearch(id: widget.id.toString()),
        ),
      ),
    );
  }
}

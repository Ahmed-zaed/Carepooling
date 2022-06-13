import 'package:carpooling_app/Controller/Firebase/firestore.dart';
import 'package:carpooling_app/Model/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Model/joiningpassenger.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Joining extends StatefulWidget {
  const Joining({Key? key}) : super(key: key);

  @override
  State<Joining> createState() => _JoiningState();
}

class _JoiningState extends State<Joining> {
  late String id;
  late String name;
  late String phone;
  late String idUser;

  late int condition;
  late String date;
  late String time;
  late String startTrip;
  late String endTrip;
  late double latitudeEnd;
  late double latitudeStart;
  late double longitudeEnd;
  late double longitudeStart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:  Text(AppLocalizations.of(context)!.joining_title),
      ),
      body: StreamBuilder<QuerySnapshot<JoiningPassenger>>(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  if (snapshot.data!.docs[index].data().condetion == 0) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage('images/khareta.jpg'),
                          radius: 40,
                        ),
                        title: Text(snapshot.data!.docs[index].data().name),
                        subtitle:  Text(AppLocalizations.of(context)!.wants_journey),
                        trailing: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  phone =
                                      snapshot.data!.docs[index].data().phone;
                                  idUser = snapshot.data!.docs[index].data().id;
                                  id = snapshot.data!.docs[index].id.toString();
                                  name = snapshot.data!.docs[index].data().name;
                                });
                                update();
                              },
                              child:  Text(AppLocalizations.of(context)!.accept),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(0, 25),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  return const Center(child: Text(''));
                },
                itemCount: snapshot.data!.docs.length,
              );
            }
            return  Center(
              child: Text(
               AppLocalizations.of(context)!.no_data,
                style: const TextStyle(fontSize: 18, color: Colors.red),
              ),
            );
          },
          stream: FireStore().readNotifications()),
    );
  }

  JoiningPassenger joiningPassenger() {
    JoiningPassenger joiningPassenger = JoiningPassenger();
    joiningPassenger.condetion = 1;
    joiningPassenger.name = name.toString();
    joiningPassenger.id = idUser;
    joiningPassenger.phone = phone;
    return joiningPassenger;
  }

  void update() async {
    await FireStore().updateJoining(
        joiningPassenger: joiningPassenger(), path: id.toString());
    addCollection();
  }

  void addCollection() async {
    await FireStore().addCollection(
        collection: collection(), path: FireStore().auth.currentUser!.uid);
  }

  Collection collection() {
    Collection collection = Collection();
    collection.phone = phone;
    collection.name = name;
    return collection;
  }



}

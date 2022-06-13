import 'package:carpooling_app/Controller/Firebase/firestore.dart';
import 'package:carpooling_app/Location&Maps/Maps/showlocation_trip.dart';
import 'package:carpooling_app/Model/joiningpassenger.dart';
import 'package:carpooling_app/Model/trip_model_passenger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TripPassenger extends StatefulWidget {
  const TripPassenger({Key? key}) : super(key: key);

  @override
  State<TripPassenger> createState() => _TripPassengerState();
}

DateTime date = DateTime.now();
late String time = '';
late String date2 = '';

late int condition;
late String path;
late String id;
late String datee;
late String timee;
late String startTrip;
late String endTrip;
late double latitudeEnd;
late double latitudeStart;

late double longitudeEnd;
late double longitudeStart;

class _TripPassengerState extends State<TripPassenger> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<TripModelPassenger>>(
      builder: (context, ahmed) {
        if (ahmed.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (ahmed.hasData && ahmed.data!.docs.isNotEmpty) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              id = ahmed.data!.docs[index].data().id;
              startTrip = ahmed.data!.docs[index].data().startTrip;
              endTrip = ahmed.data!.docs[index].data().endTrip;
              timee = ahmed.data!.docs[index].data().time;
              datee = ahmed.data!.docs[index].data().date;
              latitudeStart = ahmed.data!.docs[index].data().latitudeStart;
              latitudeEnd = ahmed.data!.docs[index].data().latitudeEnd;
              longitudeStart = ahmed.data!.docs[index].data().longitudeStart;
              longitudeEnd = ahmed.data!.docs[index].data().longitudeEnd;
              path = ahmed.data!.docs[index].id;

              return StreamBuilder<QuerySnapshot<JoiningPassenger>>(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //updateCon();

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShowLocationTrip(
                                startLatitude: ahmed.data!.docs[index]
                                    .data()
                                    .latitudeStart,
                                endLatitude:
                                    ahmed.data!.docs[index].data().latitudeEnd,
                                startLongitude: ahmed.data!.docs[index]
                                    .data()
                                    .longitudeStart,
                                endLongitude:
                                    ahmed.data!.docs[index].data().longitudeEnd,
                              ),
                            ),
                          );
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(color: Colors.black26)),
                        tileColor: snapshot.data!.docs[index]
                                    .data()
                                    .condetion ==
                                0
                            ? Colors.red
                            : snapshot.data!.docs[index].data().condetion == 1
                                ? Colors.green
                                : Colors.black,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              ahmed.data!.docs[index].data().startTrip,
                              style: const TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              AppLocalizations.of(context)!.start,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.white),
                            ),
                          ],
                        ),
                        subtitle: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  ahmed.data!.docs[index].data().endTrip,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  AppLocalizations.of(context)!.end,
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              textDirection: TextDirection.ltr,
                              children: [
                                Text(
                                  snapshot.data!.docs[index].data().condetion ==
                                          0
                                      ? AppLocalizations.of(context)!.underway
                                      : snapshot.data!.docs[index]
                                                  .data()
                                                  .condetion ==
                                              1
                                          ? AppLocalizations.of(context)!
                                              .finished
                                          : AppLocalizations.of(context)!
                                              .canceled,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.date_range,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  ahmed.data!.docs[index].data().date,
                                  style: const TextStyle(
                                      fontSize: 13, color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Icon(
                                  Icons.access_time,
                                  size: 14,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  ahmed.data!.docs[index].data().time,
                                  style: const TextStyle(
                                      fontSize: 13, color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return const Text('');
                },
                stream: FireStore().readNotifications(),
              );
            },
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: ahmed.data!.docs.length,
          );
        }
        return Center(
            child: Column(
          children: [
            const Icon(
              Icons.signal_cellular_nodata,
              size: 50,
            ),
            Text(
              AppLocalizations.of(context)!.no_data,
              style: const TextStyle(color: Colors.black, fontSize: 18),
            )
          ],
        ));
      },
      stream:
          FireStore().readTripPassenger(id: FireStore().auth.currentUser!.uid),
    );
  }
}

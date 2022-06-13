import 'package:carpooling_app/Controller/Firebase/firestore.dart';
import 'package:carpooling_app/Location&Maps/Maps/showlocation_trip.dart';
import 'package:carpooling_app/Model/trip_model.dart';
import 'package:carpooling_app/Screens/NavigatorScreen/options_trip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Trip extends StatefulWidget {
  const Trip({Key? key}) : super(key: key);

  @override
  State<Trip> createState() => _TripState();
}

DateTime date = DateTime.now();
late String date2 = '';
late int condition = 0;

int i = 0;

class _TripState extends State<Trip> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<TripModel>>(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowLocationTrip(
                          startLatitude:
                              snapshot.data!.docs[index].data().latitudeStart,
                          endLatitude:
                              snapshot.data!.docs[index].data().latitudeEnd,
                          startLongitude:
                              snapshot.data!.docs[index].data().longitudeStart,
                          endLongitude:
                              snapshot.data!.docs[index].data().longitudeEnd,
                        ),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.black26)),
                  tileColor: snapshot.data!.docs[index].data().condition ==
                          condition
                      ? Colors.green
                      : snapshot.data!.docs[index].data().condition == condition
                          ? Colors.red
                          : Colors.black,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        snapshot.data!.docs[index].data().startTrip,
                        style: const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                       Text(
                        AppLocalizations.of(context)!.start,
                        style: const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            snapshot.data!.docs[index].data().endTrip,
                            style: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                           Text(
                            AppLocalizations.of(context)!.end,
                            style: const TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        textDirection: TextDirection.ltr,
                        children: [
                          Text(
                            snapshot.data!.docs[index].data().condition ==
                                    condition
                                ?  AppLocalizations.of(context)!.underway
                                : snapshot.data!.docs[index].data().condition ==
                                        condition
                                    ?  AppLocalizations.of(context)!.finished
                                    :  AppLocalizations.of(context)!.canceled,
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
                            snapshot.data!.docs[index].data().date,
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
                            snapshot.data!.docs[index].data().time,
                            style: const TextStyle(
                                fontSize: 13, color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                  leading: Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () async {
                                await FireStore().deleteTripDriver(
                                    id: snapshot.data!.docs[index].id);
                              },
                              icon: const Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OptionTripNav(
                                      sartTrip: snapshot.data!.docs[index]
                                          .data()
                                          .startTrip,
                                      endTrip: snapshot.data!.docs[index]
                                          .data()
                                          .endTrip,
                                      numberPassenger: snapshot
                                          .data!.docs[index]
                                          .data()
                                          .numberPassenger,
                                      time: snapshot.data!.docs[index]
                                          .data()
                                          .time,
                                      date: snapshot.data!.docs[index]
                                          .data()
                                          .date,
                                      priceTrip: snapshot.data!.docs[index]
                                          .data()
                                          .priceTrip,
                                      id: snapshot.data!.docs[index].id,
                                      car:
                                          snapshot.data!.docs[index].data().car,
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.drive_file_rename_outline,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: snapshot.data!.docs.length,
          );
        }
        return Center(
            child: Column(
          children:  [
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
          FireStore().readTripDriver(path: FireStore().auth.currentUser!.uid),
    );
  }
}

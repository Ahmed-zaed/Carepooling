import 'package:carpooling_app/Controller/Firebase/firestore.dart';
import 'package:carpooling_app/Model/alltrip_model.dart';
import 'package:carpooling_app/Model/joiningpassenger.dart';
import 'package:carpooling_app/Screens/profileDriverTrips.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Model/trip_model_passenger.dart';
import '../Screens/NavigatorScreen/trip.dart';
import '../SharedPrefrances/sherdprefrances.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchTrip extends StatefulWidget {
  const SearchTrip(
      {Key? key,
      required this.time,
      required this.endNameLocation,
      required this.startNameLocation,
      required this.date})
      : super(key: key);
  final String time;
  final String startNameLocation;
  final String endNameLocation;
  final String date;

  @override
  State<SearchTrip> createState() => _SearchTripState();
}

class _SearchTripState extends State<SearchTrip> {
  int i = 0;
  late String id = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //stream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            ShController().saveAddress(startAddress: '0', endAddress: '0');
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: Colors.red,
        title: const Text('Trips similar to yours'),
      ),
      body: StreamBuilder<QuerySnapshot<AllTripModel>>(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                if (widget.endNameLocation ==
                    snapshot.data!.docs[index].data().endTrip) {
                  if (widget.startNameLocation ==
                      snapshot.data!.docs[index].data().startTrip) {
                    if (widget.date == snapshot.data!.docs[index].data().date) {
                      if (widget.time ==
                          snapshot.data!.docs[index].data().time) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfileDriverTrips(
                                      id: snapshot.data!.docs[index]
                                          .data()
                                          .id
                                          .toString(),
                                    ),
                                  ),
                                );
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  side:
                                      const BorderSide(color: Colors.black26)),
                              tileColor: Colors.black87,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
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
                                        snapshot.data!.docs[index]
                                            .data()
                                            .endTrip,
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
                                    textDirection: TextDirection.ltr,
                                    children: [
                                      Text(
                                        snapshot.data!.docs[index]
                                                    .data()
                                                    .condition ==
                                                condition
                                            ? AppLocalizations.of(context)!.underway
                                            : snapshot.data!.docs[index]
                                                        .data()
                                                        .condition ==
                                                    condition
                                                ? AppLocalizations.of(context)!.finished
                                                : AppLocalizations.of(context)!.canceled,
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
                              leading: ElevatedButton(
                                onPressed: () async {
                                  setState(() {
                                    id = snapshot.data!.docs[index].data().id;
                                  });
                                   addTrip();
                                  Navigator.pop(context);
                                },
                                child:  Text(AppLocalizations.of(context)!.joining_title),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green),
                              )),
                        );
                      }
                    }
                  }
                  return  Center(child: Text(AppLocalizations.of(context)!.no_data));
                }
                return const Center(
                  child: Text(''),
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
                ),
              ],
            ),
          );
        },
        stream: FireStore().readAllTrips(),
      ),
    );
  }

  TripModelPassenger tripModel() {
    TripModelPassenger tripModel = TripModelPassenger();
    tripModel.startTrip = widget.startNameLocation.toString();
    tripModel.endTrip = widget.endNameLocation.toString();
    tripModel.time = widget.time.toString();
    tripModel.date = widget.date.toString();
    tripModel.latitudeStart = ShController().returnLatitudeStart;
    tripModel.longitudeStart = ShController().returnLongitudeStart;
    tripModel.latitudeEnd = ShController().returnLatitudeEnd;
    tripModel.longitudeEnd = ShController().returnLongitudeEnd;
    tripModel.condition = 0;
    tripModel.id = id;
    return tripModel;
  }

  Future<void> addTrip() async {
    FireStore fireStore = FireStore();
    await fireStore.addTripPassenger(tripModel: tripModel());
    await fireStore.joiningPassenger(
        joiningPassenger: joiningPassenger(), path: id.toString());
    //await ad();
    ShController().saveAddress(startAddress: '0', endAddress: '0');
  }

  JoiningPassenger joiningPassenger() {
    JoiningPassenger joiningPassenger = JoiningPassenger();
    joiningPassenger.id = FireStore().auth.currentUser!.uid;
    joiningPassenger.condetion = 0;
    joiningPassenger.name = ShController().returnName.toString();
    joiningPassenger.phone = ShController().returnPhone.toString();
    return joiningPassenger;
  }
}

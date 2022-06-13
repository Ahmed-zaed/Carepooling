import 'package:carpooling_app/Controller/Firebase/firestore.dart';
import 'package:carpooling_app/Mixin/Helper.dart';
import 'package:carpooling_app/Location&Maps/Maps/map.dart';
import 'package:carpooling_app/Model/trip_model_passenger.dart';
import 'package:carpooling_app/Passenger/serch_trip.dart';
import 'package:carpooling_app/SharedPrefrances/sherdprefrances.dart';
import 'package:carpooling_app/Widget/Button.dart';
import 'package:carpooling_app/Widget/textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddTrip extends StatefulWidget {
  const AddTrip({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTrip> createState() => _AddTripState();
}

String? errorStart;
String? errorEnd;
String? errorCar;
String? errorPrice;
String? errorTime;
String? errorDate;
late TextEditingController _startlocationEditingController;
late TextEditingController _endlocationEditingController;
late TextEditingController _timeEditingController;
late TextEditingController _dateEditingController;

class _AddTripState extends State<AddTrip> with Helper {
  DateTime date = DateTime(2022, 5, 16);
  String? date2;
  String hintDate = 'تاريخ بدء الرحلة';
  late TimeOfDay time = const TimeOfDay(hour: 8, minute: 20);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startlocationEditingController = TextEditingController();
    _endlocationEditingController = TextEditingController();
    _timeEditingController = TextEditingController();
    _dateEditingController = TextEditingController();
    address();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _startlocationEditingController.dispose();
    _endlocationEditingController.dispose();
    _timeEditingController.dispose();
    _dateEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          children: [
            Align(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              alignment: AlignmentDirectional.centerStart,
            ),
             Align(
              child: Text(
                AppLocalizations.of(context)!.startTripLocation,
                style: const TextStyle(color: Colors.black26, fontSize: 16),
              ),
              alignment: AlignmentDirectional.topEnd,
            ),
            TextFiledWidget(
                controller: _startlocationEditingController,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Map(
                        option: 0,
                      ),
                    ),
                  );
                },
                hintText: AppLocalizations.of(context)!.from,
                icon: IconButton(
                  onPressed: () {
                    // TODO :  هنا سننتقل من بداية الضغطة على التيسكت فيلد الى الخريطة
                  },
                  icon: const Icon(Icons.location_on_outlined),
                ),
                errorText: errorStart,
                keyboardType: TextInputType.text),
            const SizedBox(
              height: 4,
            ),
             Align(
              child: Text(
                AppLocalizations.of(context)!.endTripLocation,
                style: const TextStyle(color: Colors.black26, fontSize: 16),
              ),
              alignment: AlignmentDirectional.topEnd,
            ),
            TextFiledWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Map(
                        option: 1,
                      ),
                    ),
                  );
                },
                controller: _endlocationEditingController,
                hintText: AppLocalizations.of(context)!.to,
                icon: IconButton(
                  onPressed: () {
                    // TODO : من خلال onTap هنا سننتقل من بداية الضغطة على التيسكت فيلد الى الخريطة
                  },
                  icon: const Icon(Icons.my_location),
                ),
                errorText: errorEnd,
                keyboardType: TextInputType.text),
            const SizedBox(
              height: 8,
            ),
            TextFiledWidget(
                controller: _timeEditingController,
                hintText: AppLocalizations.of(context)!.startTrip,
                onTap: () {
                  showTimePicker(context: context, initialTime: time)
                      .then((value) {
                    setState(() {
                      time = value!;
                      _timeEditingController.text = time.format(context);
                    });
                  });
                },
                //sufixText: sumDate,

                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.access_time),
                ),
                errorText: errorTime,
                keyboardType: TextInputType.datetime),
            const SizedBox(
              height: 8,
            ),
            TextFiledWidget(
                controller: _dateEditingController,
                hintText: hintDate,
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(1820),
                      lastDate: DateTime(2100));

                  if (newDate == null) return;
                  setState(() {
                    date = newDate;
                    hintDate = date.day.toString() +
                        '/' +
                        date.month.toString() +
                        '/' +
                        date.year.toString();
                  });
                },
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.date_range_outlined),
                ),
                errorText: errorTime,
                keyboardType: TextInputType.datetime),
            const SizedBox(
              height: 40,
            ),
            Button(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchTrip(
                          time: time.format(context).toString(),
                          endNameLocation: ShController().returnEndAddress,
                          startNameLocation: ShController().returnStartAddress,
                          date: hintDate.toString()),
                    ),
                  );
                  // addTrip();
                  // Navigator.pop(context);
                  // ShController().saveAddress(startAddress: '0', endAddress: '0');
                },
                text: AppLocalizations.of(context)!.searchTrip),
            const SizedBox(
              height: 12,
            ),
            Image.asset(
              'images/logored.png',
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  TripModelPassenger tripModel() {
    TripModelPassenger tripModel = TripModelPassenger();

    tripModel.startTrip = ShController().returnStartAddress;
    tripModel.endTrip = ShController().returnEndAddress;
    tripModel.time = _timeEditingController.text.toString();
    tripModel.date = hintDate.toString();
    tripModel.latitudeStart = ShController().returnLatitudeStart;
    tripModel.longitudeStart = ShController().returnLongitudeStart;
    tripModel.latitudeEnd = ShController().returnLatitudeEnd;
    tripModel.longitudeEnd = ShController().returnLongitudeEnd;
    tripModel.condition = 0;
    return tripModel;
  }

  void addTrip() async {
    FireStore fireStore = FireStore();
    await fireStore.addTripPassenger(tripModel: tripModel());
  }

  void address() {
    setState(() {
      _startlocationEditingController.text =
          ShController().returnStartAddress == '0'
              ? ''
              : ShController().returnStartAddress;
      _endlocationEditingController.text =
          ShController().returnEndAddress == '0'
              ? ''
              : ShController().returnEndAddress;
    });
  }
}

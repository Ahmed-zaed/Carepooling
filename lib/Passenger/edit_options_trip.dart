import 'package:carpooling_app/Controller/Firebase/firestore.dart';
import 'package:carpooling_app/Location&Maps/Maps/map.dart';
import 'package:carpooling_app/Mixin/Helper.dart';
import 'package:carpooling_app/Model/numberofcar.dart';
import 'package:carpooling_app/Model/trip_model_passenger.dart';
import 'package:carpooling_app/SharedPrefrances/sherdprefrances.dart';
import 'package:carpooling_app/Widget/Button.dart';
import 'package:carpooling_app/Widget/textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditTripPassenger extends StatefulWidget {
  const EditTripPassenger({
    Key? key,
    required this.time,
    required this.date,
    required this.endTrip,
    required this.sartTrip,
    required this.id,
  }) : super(key: key);
  final String sartTrip;
  final String endTrip;
  final String date;
  final String time;
  final String id;

  @override
  State<EditTripPassenger> createState() => _EditTripPassengerState();
}

String? errorStart;
String? errorEnd;
String? errorCar;
String? errorPrice;
String? errorTime;
String? errorDate;
int? selectedNumber;
late TextEditingController _startlocationEditingController;
late TextEditingController _endlocationEditingController;
late TextEditingController _timeEditingController;
late TextEditingController _dateEditingController;

class _EditTripPassengerState extends State<EditTripPassenger> with Helper {
  List<Number> number = <Number>[
    Number(id: '1', number: 1),
    Number(id: '2', number: 2),
    Number(id: '3', number: 3),
    Number(id: '4', number: 4),
    Number(id: '5', number: 5),
    Number(id: '6', number: 6),
    Number(id: '7', number: 7),
  ];

  DateTime date = DateTime(2022, 5, 16);
  String hintDate = 'تاريخ بدء الرحلة';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startlocationEditingController = TextEditingController();
    _endlocationEditingController = TextEditingController();
    _timeEditingController = TextEditingController();
    _dateEditingController = TextEditingController();

    _startlocationEditingController.text = widget.sartTrip.toString();
    _endlocationEditingController.text = widget.endTrip.toString();
    _timeEditingController.text = widget.time.toString();
    _dateEditingController.text = widget.date.toString();
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
                hintText: widget.sartTrip.toString(),
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
              child:  Text(
                AppLocalizations.of(context)!.endTripLocation,
                style: const TextStyle(color: Colors.black26, fontSize: 16),
              ),
              alignment: AlignmentDirectional.topEnd,
            ),
            TextFiledWidget(
                controller: _endlocationEditingController,
                hintText: widget.endTrip.toString(),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Map(
                                option: 1,
                              )));
                },
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
                hintText: '',
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
                hintText: hintDate = widget.date.toString(),
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(1820),
                      lastDate: DateTime(2100));

                  if (newDate == null) return;
                  setState(() {
                    date = newDate;
                    _dateEditingController.text = date.day.toString() +
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
              height: 8,
            ),
            const SizedBox(
              height: 40,
            ),
            Button(
                onPressed: () {
                  update();
                },
                text: AppLocalizations.of(context)!.update),
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

  TripModelPassenger _tripModel() {
    TripModelPassenger tripModel = TripModelPassenger();

    tripModel.startTrip = ShController().returnStartAddress == '0'
        ? widget.sartTrip.toString()
        : ShController().returnStartAddress.toString();
    tripModel.endTrip = ShController().returnEndAddress == '0'
        ? widget.endTrip.toString()
        : ShController().returnEndAddress.toString();
    tripModel.time = _timeEditingController.text.toString();
    tripModel.date = _dateEditingController.text.toString();
    tripModel.latitudeStart = ShController().returnLatitudeStart;
    tripModel.longitudeStart = ShController().returnLongitudeStart;
    tripModel.latitudeEnd = ShController().returnLatitudeEnd;
    tripModel.longitudeEnd = ShController().returnLongitudeEnd;
    tripModel.condition = 0;
    return tripModel;
  }

  void update() async {
    bool result = await FireStore().updateTripPassenger(
        tripModel: _tripModel(), path: widget.id.toString());
    if (result) {
      showSnackBare(context, message: 'Edit succeeded', visibility: !result);
      Navigator.pop(context);
    }
  }
}

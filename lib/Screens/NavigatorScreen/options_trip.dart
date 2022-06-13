import 'package:carpooling_app/Controller/Firebase/firestore.dart';
import 'package:carpooling_app/Location&Maps/Maps/map.dart';
import 'package:carpooling_app/Mixin/Helper.dart';
import 'package:carpooling_app/Model/alltrip_model.dart';
import 'package:carpooling_app/Model/numberofcar.dart';
import 'package:carpooling_app/Model/trip_model.dart';
import 'package:carpooling_app/SharedPrefrances/sherdprefrances.dart';
import 'package:carpooling_app/Widget/Button.dart';
import 'package:carpooling_app/Widget/textfiled.dart';
import 'package:flutter/material.dart';

class OptionTripNav extends StatefulWidget {
  const OptionTripNav(
      {Key? key,
      required this.numberPassenger,
      required this.priceTrip,
      required this.time,
      required this.date,
      required this.endTrip,
      required this.sartTrip,
      required this.id,
      required this.car})
      : super(key: key);
  final String sartTrip;
  final String endTrip;
  final String date;
  final String time;
  final String priceTrip;
  final int numberPassenger;
  final String id;
  final String car;

  @override
  State<OptionTripNav> createState() => _OptionTripNavState();
}

String? errorStart;
String? errorEnd;
String? errorCar;
String? errorPrice;
String? errorTime;
String? errorDate;
late int selectedNumber;
late TextEditingController _startlocationEditingController;
late TextEditingController _endlocationEditingController;
late TextEditingController _carEditingController;
late TextEditingController _priceEditingController;
late TextEditingController _timeEditingController;
late TextEditingController _dateEditingController;

class _OptionTripNavState extends State<OptionTripNav> with Helper {
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
  late TimeOfDay time;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startlocationEditingController = TextEditingController();
    _endlocationEditingController = TextEditingController();
    _carEditingController = TextEditingController();
    _priceEditingController = TextEditingController();
    _timeEditingController = TextEditingController();
    _dateEditingController = TextEditingController();
    time = TimeOfDay.now();
    selectedNumber = widget.numberPassenger.toInt();
    _startlocationEditingController.text = widget.sartTrip.toString();
    _endlocationEditingController.text = widget.endTrip.toString();
    _carEditingController.text = widget.car.toString();
    _startlocationEditingController.text = widget.sartTrip.toString();
    _timeEditingController.text = widget.time.toString();
    _dateEditingController.text = widget.date.toString();
    _priceEditingController.text = widget.priceTrip.toString();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _startlocationEditingController.dispose();
    _endlocationEditingController.dispose();
    _carEditingController.dispose();
    _priceEditingController.dispose();
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
            const Align(
              child: Text(
                'اختر موقع بدء الرحلة',
                style: TextStyle(color: Colors.black26, fontSize: 16),
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
                              )));
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
            const Align(
              child: Text(
                'اختر موقع نهاية الرحلة',
                style: TextStyle(color: Colors.black26, fontSize: 16),
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
                controller: _carEditingController,
                hintText: 'dd',
                // نوع المركبة
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.directions_car_outlined),
                ),
                errorText: errorCar,
                keyboardType: TextInputType.text),
            const SizedBox(
              height: 8,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButton<int>(
                underline: const Divider(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(8),
                value: selectedNumber,
                //الركاب
                hint: Align(
                    alignment: AlignmentDirectional.center,
                    child: Text(widget.numberPassenger.toString())),
                isExpanded: true,
                items: number
                    .map(
                      (Number number) => DropdownMenuItem<int>(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.circle,
                              color: Color(0xffB40000),
                              size: 12,
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(number.number.toString())),
                          ],
                        ),
                        value: number.number,
                      ),
                    )
                    .toList(),
                onChanged: (int? value) {
                  if (value != null) {
                    setState(() {
                      selectedNumber = value;
                    });
                  }
                },
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xffC1C1C1), width: 1),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFiledWidget(
                controller: _timeEditingController,
                hintText: '',
                //sufixText: sumDate,
                onTap: () {
                  showTimePicker(context: context, initialTime: time)
                      .then((value) {
                    setState(() {
                      time = value!;
                      _timeEditingController.text = time.format(context);
                    });
                  });
                },
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
            TextFiledWidget(
                controller: _priceEditingController,
                prificxText: 'جنيه مصري',
                hintText: widget.priceTrip.toString(),
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.price_change),
                ),
                errorText: errorPrice,
                keyboardType: TextInputType.number),
            const SizedBox(
              height: 40,
            ),
            Button(
                onPressed: ()async {
                  await update();
                  //time();
                },
                text: 'Save Update'),
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

  TripModel _tripModel() {
    TripModel tripModel = TripModel();

    tripModel.startTrip = ShController().returnStartAddress == '0'
        ? widget.sartTrip.toString()
        : ShController().returnStartAddress.toString();
    tripModel.endTrip = ShController().returnEndAddress == '0'
        ? widget.endTrip.toString()
        : ShController().returnEndAddress.toString();
    tripModel.time = _timeEditingController.text.toString();
    tripModel.date = _dateEditingController.text.toString();
    tripModel.numberPassenger = selectedNumber;
    tripModel.priceTrip = _priceEditingController.text.toString();
    tripModel.car = _carEditingController.text.toString();
    tripModel.latitudeStart = ShController().returnLatitudeStart;
    tripModel.longitudeStart = ShController().returnLongitudeStart;
    tripModel.latitudeEnd = ShController().returnLatitudeEnd;
    tripModel.longitudeEnd = ShController().returnLongitudeEnd;
    tripModel.condition = 0;
    return tripModel;
  }

  AllTripModel allTripModel() {
    AllTripModel tripModel = AllTripModel();

    tripModel.startTrip = ShController().returnStartAddress == '0'
        ? widget.sartTrip.toString()
        : ShController().returnStartAddress.toString();
    tripModel.endTrip = ShController().returnEndAddress == '0'
        ? widget.endTrip.toString()
        : ShController().returnEndAddress.toString();
    tripModel.time = _timeEditingController.text.toString();
    tripModel.date = _dateEditingController.text.toString();
    tripModel.numberPassenger = selectedNumber;
    tripModel.priceTrip = _priceEditingController.text.toString();
    tripModel.car = _carEditingController.text.toString();
    tripModel.latitudeStart = ShController().returnLatitudeStart;
    tripModel.longitudeStart = ShController().returnLongitudeStart;
    tripModel.latitudeEnd = ShController().returnLatitudeEnd;
    tripModel.longitudeEnd = ShController().returnLongitudeEnd;
    tripModel.condition = 0;
    tripModel.id = FireStore().auth.currentUser!.uid.toString();
    return tripModel;
  }

  Future<void> update() async {
    bool result = await FireStore()
        .updateTripDriver(tripModel: _tripModel(), path: widget.id.toString());
    bool resultAll = await FireStore().updateTripInAllTrips(
        allTripModel: allTripModel(), path: widget.id.toString());
    if (result) {
      showSnackBare(context, message: 'Edit succeeded', visibility: !result);
      ShController().saveAddress(startAddress: '0', endAddress: '0');
      Navigator.pop(context);
    }
  }
}

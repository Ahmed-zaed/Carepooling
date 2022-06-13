import 'package:flutter/material.dart';

import '../Model/numberofcar.dart';
import '../Widget/Button.dart';
import '../Widget/textfiled.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

String? errorName;
String? errorEnd;
String? errorCar;
String? errorPrice;
String? errorTime;
String? errorDate;
int? selectedNumber;
late TextEditingController _startlocationEditingController;
late TextEditingController _endlocationEditingController;
late TextEditingController _carEditingController;
late TextEditingController _priceEditingController;
late TextEditingController _timeEditingController;
late TextEditingController _dateEditingController;
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
class _EditProfileState extends State<EditProfile> {
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
      appBar: AppBar(
        title:  Text(
          AppLocalizations.of(context)!.editProfile,
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          children: [
            const Center(
              child: CircleAvatar(
                backgroundColor: Color(0xffEF9A9A),
                radius: 80,
                backgroundImage: AssetImage('images/khareta.jpg'),
              ),
            ),
            const SizedBox(height: 15,),
            TextFiledWidget(
                controller: _startlocationEditingController,
                hintText: AppLocalizations.of(context)!.name_auth,
                icon: IconButton(
                  onPressed: () {
                    // TODO :  هنا سننتقل من بداية الضغطة على التيسكت فيلد الى الخريطة
                  },
                  icon: const Icon(Icons.person),
                ),
                errorText: errorName,
                keyboardType: TextInputType.text),
            const SizedBox(
              height: 10,
            ),

            TextFiledWidget(
                controller: _endlocationEditingController,
                hintText: AppLocalizations.of(context)!.email,
                icon: IconButton(
                  onPressed: () {
                    // TODO : من خلال onTap هنا سننتقل من بداية الضغطة على التيسكت فيلد الى الخريطة
                  },
                  icon: const Icon(Icons.email),
                ),
                errorText: errorEnd,
                keyboardType: TextInputType.text),
            const SizedBox(
              height: 8,
            ),
            TextFiledWidget(
                controller: _carEditingController,
                hintText: AppLocalizations.of(context)!.mobile,
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.phone_android),
                ),
                errorText: errorCar,
                keyboardType: TextInputType.text),
            const SizedBox(
              height: 8,
            ),
           
            const SizedBox(
              height: 8,
            ),
            TextFiledWidget(
                controller: _timeEditingController,
                hintText: AppLocalizations.of(context)!.startTrip,
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
              height: 8,
            ),
            TextFiledWidget(
                controller: _priceEditingController,
                prificxText:AppLocalizations.of(context)!.price,
                hintText: AppLocalizations.of(context)!.cost,
                icon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.price_change),
                ),
                errorText: errorPrice,
                keyboardType: TextInputType.number),
            const SizedBox(
              height: 40,
            ),
            Button(onPressed: () {}, text: AppLocalizations.of(context)!.add_trip),
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
}

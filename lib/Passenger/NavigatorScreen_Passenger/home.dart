import 'package:carpooling_app/Widget/Button.dart';
import 'package:flutter/material.dart';

class HomePassenger extends StatefulWidget {
  const HomePassenger({Key? key}) : super(key: key);

  @override
  State<HomePassenger> createState() => _HomePassengerState();
}

class _HomePassengerState extends State<HomePassenger> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      children: [
        const Icon(
          Icons.directions_car,
          size: 200,
        ),
        const Divider(
          color: Colors.transparent,
        ),
        const SizedBox(
          height: 50,
        ),
        Button(
            onPressed: () {
              Navigator.pushNamed(context, '/AddTripScreen');
            },
            text: 'Join a trip'),
        const SizedBox(
          height: 12,
        ),
        const Text(
          'يمكنك بالضغط على الزر الانضمام الى رحلة واختيار الرحلة المناسبة لك والطلب من اي سائق في طريقه نفس رحلتك ان تنضم معه',
          style: TextStyle(color: Colors.black54, fontSize: 14),
        )
      ],
    );
  }
}

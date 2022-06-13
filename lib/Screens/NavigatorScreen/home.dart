import 'package:carpooling_app/Widget/Button.dart';
import 'package:flutter/material.dart';
import'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              Navigator.pushNamed(context, '/OptionTrip_Screen');
            },
            text: AppLocalizations.of(context)!.add_trip),
        const SizedBox(
          height: 14,
        ),
         Text(
          AppLocalizations.of(context)!.disc_addTrips,
          style: const TextStyle(color: Colors.black54, fontSize: 14),
        )
      ],
    );
  }
}

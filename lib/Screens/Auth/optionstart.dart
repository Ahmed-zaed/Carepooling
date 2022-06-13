import 'package:carpooling_app/Widget/Button.dart';
import 'package:carpooling_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OptionStart extends StatefulWidget {
  const OptionStart({Key? key}) : super(key: key);

  @override
  State<OptionStart> createState() => _OptionStartState();
}

class _OptionStartState extends State<OptionStart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                AppLocalizations.of(context)!.choose_login_application,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Button(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/HomeScreen');
                },
                text: AppLocalizations.of(context)!.name),
            Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                AppLocalizations.of(context)!.driverDoc,
                style: const TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ),
            Button(
                onPressed: () async {
                  Navigator.pushReplacementNamed(context, '/HomePassenger');
                },
                text: AppLocalizations.of(context)!.passenger),
            Align(
              alignment: AlignmentDirectional.center,
              child: Text(
                AppLocalizations.of(context)!.passengerDocu,
                style: const TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ),
            const Divider(
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}

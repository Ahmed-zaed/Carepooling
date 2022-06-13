import 'package:carpooling_app/Passenger/add_trip.dart';
import 'package:carpooling_app/Passenger/home_passenger.dart';
import 'package:carpooling_app/Screens/Auth/optionstart.dart';
import 'package:carpooling_app/Screens/Auth/sign_in.dart';
import 'package:carpooling_app/Screens/Auth/sign_up.dart';
import 'package:carpooling_app/Screens/StartScreen/splashscreen.dart';
import 'package:carpooling_app/Screens/home.dart';
import 'package:carpooling_app/Location&Maps/Maps/map.dart';
import 'package:carpooling_app/Screens/notificatons.dart';
import 'package:carpooling_app/Screens/options_trip.dart';
import 'package:carpooling_app/SharedPrefrances/sherdprefrances.dart';
import 'package:carpooling_app/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await ShController().sharedInstance();

  runApp(const CarpoolingApp());
}

class CarpoolingApp extends StatelessWidget {
  const CarpoolingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],

      //locale: const Locale('en'),
      initialRoute: '/SplashScreen',
      routes: {
        '/SplashScreen': (context) => const SplashScreen(),
        '/SignUp_Screen': (context) => const SignUp(),
        '/SignIn_Screen': (context) => const SignIn(),
        '/HomeScreen': (context) => const HomeScreen(),
        '/OptionStart_Screen': (context) => const OptionStart(),
        '/OptionTrip_Screen': (context) => const OptionsTrip(),
        '/MapScreen': (context) => const Map(),
        '/HomePassenger': (context) => const HomeScreenPassenger(),
        '/AddTripScreen': (context) => const AddTrip(),
        '/Notification': (context) => const Joining(),
      },
    );
  }
}

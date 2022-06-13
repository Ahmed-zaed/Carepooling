import 'package:carpooling_app/SharedPrefrances/sherdprefrances.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bool result = ShController().resultSave;
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(
            context, result == true ? '/OptionStart_Screen' : '/SignUp_Screen');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: const Color(0xffB40000),
        ),
        Align(
          child: Image.asset('images/logo.png'),
          alignment: Alignment.center,
        ),
      ],
    ));
  }
}

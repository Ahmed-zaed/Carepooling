import 'package:carpooling_app/Controller/Firebase/authfirebase.dart';
import 'package:carpooling_app/Mixin/Helper.dart';
import 'package:carpooling_app/Model/messegeauth_firebase.dart';
import 'package:carpooling_app/SharedPrefrances/sherdprefrances.dart';
import 'package:carpooling_app/Widget/textfiled.dart';
import 'package:flutter/material.dart';

import '../../Location&Maps/controller_location.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Widget/Button.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

late TextEditingController _emailEditingController;
late TextEditingController _passwordEditingController;
String? errorTextemail;
String? errorTextPassword;
bool password = true;

class _SignInState extends State<SignIn> with Helper {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ControllerLocation().checkLocationServes();
    _emailEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(
            height: 30,
          ),
          Image.asset(
            'images/logored.png',
            height: 290,
            width: 290,
          ),
          TextFiledWidget(
              controller: _emailEditingController,
              hintText: AppLocalizations.of(context)!.email,
              icon: IconButton(onPressed: () {}, icon: const Icon(Icons.email)),
              errorText: errorTextemail,
              keyboardType: TextInputType.emailAddress),
          const SizedBox(
            height: 6,
          ),
          TextFiledWidget(
              controller: _passwordEditingController,
              hintText: AppLocalizations.of(context)!.password,
              obscureText: password,
              icon: IconButton(
                onPressed: () {
                  setState(() {
                    password = !password;
                    Future.delayed(const Duration(milliseconds: 700), () {
                      if (password == false) {
                        setState(() {
                          password = true;
                        });
                      }
                    });
                  });
                },
                icon: Icon(
                    password == true ? Icons.visibility_off : Icons.visibility),
              ),
              errorText: errorTextPassword,
              keyboardType: TextInputType.text),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ForgetPassword_Screen');
              },
              child:  Text(
               AppLocalizations.of(context)!.forgetPass,
                style: const TextStyle(color: Colors.black45, fontSize: 14),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Button(
            text: AppLocalizations.of(context)!.signIn,
            onPressed: () {
              //signIn();
              signIn();
            },
          ),
        ],
      ),
    );
  }

  // void signIn() {
  //   if (checkTextFiledEmpty()) {
  //     Navigator.pushNamed(context, '/Signup_Screen');
  //   }
  // }

  void signIn() async {
    if (checkTextFiledEmpty()) {
      AuthFirebase signIn = AuthFirebase();
      MessegeAuthFireBase messege = await signIn.signIn(
          email: _emailEditingController.text,
          password: _passwordEditingController.text);
      showSnackBare(context,
          message: messege.messege, visibility: messege.error);
      if (messege.error == false) {
        ShController().save(email: _emailEditingController.text);
        Navigator.pushReplacementNamed(context, '/OptionStart_Screen');
      }
    }
  }

  bool checkTextFiledEmpty() {
    if (_emailEditingController.text.isNotEmpty &&
        _passwordEditingController.text.isNotEmpty) {
      errorTextFiled();
      return true;
    } else {
      errorTextFiled();
      return false;
    }
  }

  void errorTextFiled() {
    setState(() {
      errorTextemail =
          _emailEditingController.text.isEmpty ? AppLocalizations.of(context)!.email_empty : null;
      errorTextPassword = _passwordEditingController.text.isEmpty
          ? AppLocalizations.of(context)!.password_empty
          : null;
    });
  }
}

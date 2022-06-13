import 'package:carpooling_app/Controller/Firebase/authfirebase.dart';
import 'package:carpooling_app/Controller/Firebase/firestore.dart';
import 'package:carpooling_app/Mixin/Helper.dart';
import 'package:carpooling_app/Model/messegeauth_firebase.dart';
import 'package:carpooling_app/Model/users.dart';
import 'package:carpooling_app/SharedPrefrances/sherdprefrances.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Widget/Button.dart';
import '../../Widget/textcontroller.dart';
import '../../Widget/textfiled.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

late TextEditingController _nameEditingController;
late TextEditingController _emailEditingController;
late TextEditingController _passwordEditingController;
late String? errorName =null;

late String? errorEmail = null;
late String? errorPassword = null;
bool password = true;
int _count = 0;
int errorGender = 0;
late String genderOption = 'Male';

class _SignUpState extends State<SignUp> with Helper {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameEditingController = TextEditingController();
    _emailEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameEditingController.dispose();
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
          Image.asset(
            'images/logored.png',
            height: 290,
            width: 290,
          ),
          const SizedBox(
            height: 10,
          ),
          TextFiledWidget(
              hintText:AppLocalizations.of(context)!.name_auth ,
              errorText: errorName,
              controller: _nameEditingController,
              icon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person),
              ),
              keyboardType: TextInputType.name),
          const SizedBox(
            height: 6,
          ),
          TextFiledWidget(
              controller: _emailEditingController,
              errorText: errorEmail,
              hintText: AppLocalizations.of(context)!.email,
              icon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress),
          const SizedBox(
            height: 6,
          ),
          TextFiledWidget(
            controller: _passwordEditingController,
            errorText: errorPassword,
            hintText: AppLocalizations.of(context)!.password,
            keyboardType: TextInputType.text,
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
                icon: Icon(password == true
                    ? Icons.visibility_off
                    : Icons.visibility)),
            obscureText: password,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(AppLocalizations.of(context)!.gender ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _count == 0 ? _count++ : _count--;
                          });
                        },
                        child: TextContainer(
                          genderName: AppLocalizations.of(context)!.male,
                          color: _count == 1
                              ? const Color(0xffB40000)
                              : Colors.transparent,
                          count: _count,
                          textcolor: _count == 1
                              ? Colors.white
                              : const Color(0xff717171),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _count == 1 || _count == 0
                                ? _count = 2
                                : _count = 0;
                          });
                        },
                        child: TextContainer(
                          genderName:AppLocalizations.of(context)!.female,
                          color: _count == 2
                              ? const Color(0xffB40000)
                              : Colors.transparent,
                          count: _count,
                          textcolor: _count == 2
                              ? Colors.white
                              : const Color(0xff717171),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: const Color(0xffC1C1C1)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          Padding(
            child: Visibility(
                visible: errorGender == 1 ? true : false,
                child:  Text(
                  AppLocalizations.of(context)!.gender_empty,
                  style: const TextStyle(color: Colors.red),
                )),
            padding: const EdgeInsets.symmetric(horizontal: 9),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                AppLocalizations.of(context)!.have_account,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/SignIn_Screen');
                },
                child:  Text(
                  AppLocalizations.of(context)!.signIn,
                  style: const TextStyle(color: Color(0xffAB1D1D), fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Button(
              onPressed: () {
                signUp();
              },
              text:AppLocalizations.of(context)!.signUp),
        ],
      ),
    );
  }

  void signUp() async {
    AuthFirebase auth = AuthFirebase();
    if (checkTextFiledEmpty()) {
      MessegeAuthFireBase message = await auth.authWitheEmail(
          email: _emailEditingController.text,
          password: _passwordEditingController.text);
      showSnackBare(context,
          message: message.messege, visibility: message.error);
      if (message.error == false) {
        bool result = await create();
        if (result) {
          saveInformationDriver();
        }
        Navigator.pushReplacementNamed(context, '/SignIn_Screen');
      }
    }
  }

  bool checkTextFiledEmpty() {
    if (_nameEditingController.text.isNotEmpty &&
        _emailEditingController.text.isNotEmpty &&
        _passwordEditingController.text.isNotEmpty &&
        _count != 0) {
      errorTextFiled();
      return true;
    } else {
      errorTextFiled();
      return false;
    }
  }

  void errorTextFiled() {
    setState(() {
      errorName =
          _nameEditingController.text.isEmpty ? AppLocalizations.of(context)!.name_empty : null;
      errorEmail =
          _emailEditingController.text.isEmpty ? AppLocalizations.of(context)!.email_empty : null;
      errorPassword = _passwordEditingController.text.isEmpty
          ? AppLocalizations.of(context)!.password_empty
          : null;
      errorGender = _count == 0 ? 1 : 0;
      genderOption = _count == 2 ? 'Female' : 'Male';
    });
  }

  Future<bool> create() async {
    FireStore fireStore = FireStore();
    return await fireStore.createAcount(users: users());
  }

  Users users() {
    Users user = Users();
    user.name = _nameEditingController.text.toString();
    user.email = _emailEditingController.text.toString();
    user.phone = '000000000000';
    user.location = '-';
    user.gender = genderOption;
    user.car = '_';
    return user;
  }

  void saveInformationDriver() {
    ShController().saveInformation(
        phone: '000000000',
        car: '-',
        city: '-',
        name: _nameEditingController.text.toString(),
        gender: genderOption.toString());
  }
}

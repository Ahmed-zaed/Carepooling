// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Driver`
  String get name {
    return Intl.message(
      'Driver',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Passenger`
  String get passenger {
    return Intl.message(
      'Passenger',
      name: 'passenger',
      desc: '',
      args: [],
    );
  }

  /// `The feature of entering the application as a driver enables you to\n add trips and go to the trip with the people you choose according to your desire from the same city. \n The passengers who were added with you can track the trip and communicate with you. Let’s go on your trip with your friends participating in the same trip`
  String get driverDoc {
    return Intl.message(
      'The feature of entering the application as a driver enables you to\n add trips and go to the trip with the people you choose according to your desire from the same city. \n The passengers who were added with you can track the trip and communicate with you. Let’s go on your trip with your friends participating in the same trip',
      name: 'driverDoc',
      desc: '',
      args: [],
    );
  }

  /// `The feature of entering the application as a passenger enables \n you to join trips and go on the trip with the people you choose according to your desire from the same city\n and enables the drivers with whom you have been added to track the trip and communicate with you. Let’s go on your trip with your friends participating in the same trip`
  String get passengerDocu {
    return Intl.message(
      'The feature of entering the application as a passenger enables \n you to join trips and go on the trip with the people you choose according to your desire from the same city\n and enables the drivers with whom you have been added to track the trip and communicate with you. Let’s go on your trip with your friends participating in the same trip',
      name: 'passengerDocu',
      desc: '',
      args: [],
    );
  }

  /// `Choose how you will enter the application`
  String get choose_login_application {
    return Intl.message(
      'Choose how you will enter the application',
      name: 'choose_login_application',
      desc: '',
      args: [],
    );
  }

  /// `ADD TRIP`
  String get add_trip {
    return Intl.message(
      'ADD TRIP',
      name: 'add_trip',
      desc: '',
      args: [],
    );
  }

  /// `You can click on the button to add a trip and share it so that the people next to you and going on the same route can join you for the same trip`
  String get disc_addTrips {
    return Intl.message(
      'You can click on the button to add a trip and share it so that the people next to you and going on the same route can join you for the same trip',
      name: 'disc_addTrips',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get mobile {
    return Intl.message(
      'Mobile',
      name: 'mobile',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get city {
    return Intl.message(
      'City',
      name: 'city',
      desc: '',
      args: [],
    );
  }

  /// `Car`
  String get car {
    return Intl.message(
      'Car',
      name: 'car',
      desc: '',
      args: [],
    );
  }

  /// `NO DATA!!`
  String get no_data {
    return Intl.message(
      'NO DATA!!',
      name: 'no_data',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `wants to join your journey`
  String get wants_journey {
    return Intl.message(
      'wants to join your journey',
      name: 'wants_journey',
      desc: '',
      args: [],
    );
  }

  /// `Joining`
  String get joining_title {
    return Intl.message(
      'Joining',
      name: 'joining_title',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name_auth {
    return Intl.message(
      'Name',
      name: 'name_auth',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `The gender field is empty`
  String get gender_empty {
    return Intl.message(
      'The gender field is empty',
      name: 'gender_empty',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get have_account {
    return Intl.message(
      'Already have an account?',
      name: 'have_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get signUp {
    return Intl.message(
      'SignUp',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Name field is empty`
  String get name_empty {
    return Intl.message(
      'Name field is empty',
      name: 'name_empty',
      desc: '',
      args: [],
    );
  }

  /// `Email field is empty`
  String get email_empty {
    return Intl.message(
      'Email field is empty',
      name: 'email_empty',
      desc: '',
      args: [],
    );
  }

  /// `Password field is empty`
  String get password_empty {
    return Intl.message(
      'Password field is empty',
      name: 'password_empty',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password`
  String get forgetPass {
    return Intl.message(
      'Forgot your password',
      name: 'forgetPass',
      desc: '',
      args: [],
    );
  }

  /// `Start: `
  String get start {
    return Intl.message(
      'Start: ',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `End: `
  String get end {
    return Intl.message(
      'End: ',
      name: 'end',
      desc: '',
      args: [],
    );
  }

  /// `Underway`
  String get underway {
    return Intl.message(
      'Underway',
      name: 'underway',
      desc: '',
      args: [],
    );
  }

  /// `Finished`
  String get finished {
    return Intl.message(
      'Finished',
      name: 'finished',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get canceled {
    return Intl.message(
      'Canceled',
      name: 'canceled',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Time Start Trips`
  String get startTrip {
    return Intl.message(
      'Time Start Trips',
      name: 'startTrip',
      desc: '',
      args: [],
    );
  }

  /// `Egyptian Pound`
  String get price {
    return Intl.message(
      'Egyptian Pound',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Estimated Cost`
  String get cost {
    return Intl.message(
      'Estimated Cost',
      name: 'cost',
      desc: '',
      args: [],
    );
  }

  /// `UPDATE`
  String get update {
    return Intl.message(
      'UPDATE',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Choose your starting location`
  String get startTripLocation {
    return Intl.message(
      'Choose your starting location',
      name: 'startTripLocation',
      desc: '',
      args: [],
    );
  }

  /// `Choose your flight departure location`
  String get endTripLocation {
    return Intl.message(
      'Choose your flight departure location',
      name: 'endTripLocation',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Search for a flight`
  String get searchTrip {
    return Intl.message(
      'Search for a flight',
      name: 'searchTrip',
      desc: '',
      args: [],
    );
  }

  /// `Trips similar to yours`
  String get tripsSimilar {
    return Intl.message(
      'Trips similar to yours',
      name: 'tripsSimilar',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

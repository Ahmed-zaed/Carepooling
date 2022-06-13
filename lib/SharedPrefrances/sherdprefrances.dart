
import 'package:shared_preferences/shared_preferences.dart';

enum Keys {
  email,
  login,
  name,
  phone,
  car,
  city,
  gender,
  checkGps,
  longitude,
  latitude,
  longitudeStart,
  latitudeStart,
  longitudeEnd,
  latitudeEnd,
  startAddress,
  endAddress,
  statues
}

class ShController {
  late SharedPreferences _sharedPreferences;

  static final ShController _instance = ShController._();

  factory ShController() {
    return _instance;
  }

  ShController._();

  Future<void> sharedInstance() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required String email}) async {
    await _sharedPreferences.setString(Keys.email.toString(), email);
    await _sharedPreferences.setBool(Keys.login.toString(), true);
  }

  Future<void> saveInformation(
      {required String phone,
      required String car,
      required String city,
      required String name,
      required String gender}) async {
    await _sharedPreferences.setString(Keys.phone.toString(), phone);
    await _sharedPreferences.setString(Keys.car.toString(), car);
    await _sharedPreferences.setString(Keys.city.toString(), city);
    await _sharedPreferences.setString(Keys.name.toString(), name);
    await _sharedPreferences.setString(Keys.gender.toString(), gender);
  }

  Future<void> checkGps({required bool gps}) async {
    await _sharedPreferences.setBool(Keys.checkGps.toString(), gps);
  }

  Future<void> saveLocationUser(
      {required double latitude, required double longitude}) async {
    await _sharedPreferences.setDouble(Keys.latitude.toString(), latitude);
    await _sharedPreferences.setDouble(Keys.longitude.toString(), longitude);
  }

  Future<void> saveStartLanLong(
      {required double latitudeStart, required double longitudeStart}) async {
    await _sharedPreferences.setDouble(
        Keys.latitudeStart.toString(), latitudeStart);
    await _sharedPreferences.setDouble(
        Keys.longitudeStart.toString(), longitudeStart);
  }

  Future<void> saveEndLanLong(
      {required double latitudeEnd, required double longitudeEnd}) async {
    await _sharedPreferences.setDouble(
        Keys.latitudeEnd.toString(), latitudeEnd);
    await _sharedPreferences.setDouble(
        Keys.longitudeEnd.toString(), longitudeEnd);
  }

  Future<void> saveAddress(
      {required String startAddress, required String endAddress}) async {
    await _sharedPreferences.setString(
        Keys.startAddress.toString(), startAddress);
    await _sharedPreferences.setString(Keys.endAddress.toString(), endAddress);
  }

  Future<void> saveStatuseNotifi({required int statuse}) async {
    await _sharedPreferences.setInt(Keys.statues.toString(), statuse);
  }

  bool get resultSave =>
      _sharedPreferences.getBool(Keys.login.toString()) ?? false;

  int get resultStatuseNotfi =>
      _sharedPreferences.getInt(Keys.statues.toString()) ?? 0;

  String get printemail =>
      _sharedPreferences.getString(Keys.email.toString()) ?? 'dsd@gmail.com';

  String get returnName =>
      _sharedPreferences.getString(Keys.name.toString()) ?? 'Driver';

  String get returnPhone =>
      _sharedPreferences.getString(Keys.phone.toString()) ?? '-------';

  String get returnCar =>
      _sharedPreferences.getString(Keys.car.toString()) ?? '-------';

  String get returnCity =>
      _sharedPreferences.getString(Keys.city.toString()) ?? '-------';

  String get returnStartAddress =>
      _sharedPreferences.getString(Keys.startAddress.toString()) ?? '0';

  String get returnEndAddress =>
      _sharedPreferences.getString(Keys.endAddress.toString()) ?? '0';

  String get returnGender =>
      _sharedPreferences.getString(Keys.gender.toString()) ?? '-------';

  bool get returnGpsChecked =>
      _sharedPreferences.getBool(Keys.checkGps.toString()) ?? false;

  double get returnLatitude =>
      _sharedPreferences.getDouble(Keys.latitude.toString()) ?? 0;

  double get returnLongitude =>
      _sharedPreferences.getDouble(Keys.longitude.toString()) ?? 0;

  double get returnLatitudeStart =>
      _sharedPreferences.getDouble(Keys.latitudeStart.toString()) ?? 0;

  double get returnLongitudeStart =>
      _sharedPreferences.getDouble(Keys.longitudeStart.toString()) ?? 0;

  double get returnLatitudeEnd =>
      _sharedPreferences.getDouble(Keys.latitudeEnd.toString()) ?? 0;

  double get returnLongitudeEnd =>
      _sharedPreferences.getDouble(Keys.longitudeEnd.toString()) ?? 0;
}

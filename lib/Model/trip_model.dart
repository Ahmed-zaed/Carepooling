
class TripModel {
  late String startTrip;
  late String endTrip;
  late String date;
  late String time;
  late int condition;
  late String priceTrip;
  late int numberPassenger;
  late String car;
  late double latitudeStart;
  late double longitudeStart;
  late double latitudeEnd;
  late double longitudeEnd;

  TripModel();

  TripModel.fromMap(Map<String, dynamic> map) {
    startTrip = map['startTrip'];
    endTrip = map['endTrip'];
    date = map['data'];
    time = map['time'];
    condition = map['condition'];
    priceTrip = map['priceTrip'];
    car = map['car'];
    numberPassenger = map['numberPassenger'];
    latitudeStart = map['latitudeStart'];
    longitudeStart = map['longitudeStart'];
    latitudeEnd = map['latitudeEnd'];
    longitudeEnd = map['longitudeEnd'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['startTrip'] = startTrip;
    map['endTrip'] = endTrip;
    map['data'] = date;
    map['time'] = time;
    map['condition'] = condition;
    map['priceTrip'] = priceTrip;
    map['numberPassenger'] = numberPassenger;
    map['car'] = car;
    map['latitudeStart'] = latitudeStart;
    map['longitudeStart'] = longitudeStart;
    map['latitudeEnd'] = latitudeEnd;
    map['longitudeEnd'] = longitudeEnd;
    return map;
  }
}

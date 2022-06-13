class TripModelPassenger {
  late String startTrip;
  late String endTrip;
  late String date;
  late String time;
  late int condition;
  late double latitudeStart;
  late double longitudeStart;
  late double latitudeEnd;
  late double longitudeEnd;
  late String id;

  TripModelPassenger();

  TripModelPassenger.fromMap(Map<String, dynamic> map) {
    startTrip = map['startTrip'];
    endTrip = map['endTrip'];
    date = map['data'];
    time = map['time'];
    condition = map['condition'];
    latitudeStart = map['latitudeStart'];
    longitudeStart = map['longitudeStart'];
    latitudeEnd = map['latitudeEnd'];
    longitudeEnd = map['longitudeEnd'];
    id = map['id'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['startTrip'] = startTrip;
    map['endTrip'] = endTrip;
    map['data'] = date;
    map['time'] = time;
    map['condition'] = condition;
    map['latitudeStart'] = latitudeStart;
    map['longitudeStart'] = longitudeStart;
    map['latitudeEnd'] = latitudeEnd;
    map['longitudeEnd'] = longitudeEnd;
    map['id'] = id;
    return map;
  }
}

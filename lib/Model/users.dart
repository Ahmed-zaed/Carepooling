class Users {
  late String name;
  late String phone;
  late String location;
  late String email;
  late String gender;
  late String car;

  Users();

  Users.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    phone = map['phone'];
    location = map['location'];
    email = map['email'];
    gender = map['gender'];
    car = map['Car'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['location'] = location;
    map['email'] = email;
    map['gender'] = gender;
    map['Car'] = car;
    return map;
  }
}

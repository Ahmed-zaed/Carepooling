class Collection {
  late String name;
  late String phone;

  Collection();

  Collection.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    phone = map['phone'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    return map;
  }
}

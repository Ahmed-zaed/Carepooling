class JoiningPassenger{
  late String id;
  late int condetion;
  late String name;
  late String phone;

  JoiningPassenger();

  JoiningPassenger.fromMap(Map<String,dynamic> map){
    id = map['id'];
    condetion = map['condetion'];
    name = map['name'];
    phone = map['phone'];
  }
  Map<String,dynamic>toMap(){
    Map<String , dynamic> map = <String , dynamic>{};

    map['id'] = id;
    map['condetion'] = condetion;
    map['name'] = name;
    map['phone'] = phone;
    return map;
  }
}
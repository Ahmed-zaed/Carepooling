class NotificationsModel {
  late int notificationStatus;
  late String idUser;

  NotificationsModel();

  NotificationsModel.fromMap(Map<String, dynamic> map) {
    notificationStatus = map['notificationStatus'];
    idUser = map['idUser'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['notificationStatus'] = notificationStatus;
    map['idUser'] = idUser;
    return map;
  }
}

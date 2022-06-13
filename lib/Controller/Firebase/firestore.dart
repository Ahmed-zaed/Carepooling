import 'package:carpooling_app/Model/alltrip_model.dart';
import 'package:carpooling_app/Model/collection.dart';
import 'package:carpooling_app/Model/joiningpassenger.dart';
import 'package:carpooling_app/Model/notifications_model.dart';
import 'package:carpooling_app/Model/trip_model.dart';
import 'package:carpooling_app/Model/trip_model_passenger.dart';
import 'package:carpooling_app/Model/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStore {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> createAcount({required Users users}) async {
    return await _instance
        .collection('Users')
        .doc(auth.currentUser?.uid)
        .set(users.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> updateDataDriver({required Users users}) async {
    return await _instance
        .collection('Users')
        .doc(auth.currentUser?.uid)
        .update(users.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> updateTripDriver(
      {required TripModel tripModel, required String path}) async {
    return await _instance
        .collection('Users')
        .doc(auth.currentUser?.uid)
        .collection('Trip')
        .doc(path)
        .update(tripModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> updateTripPassenger(
      {required TripModelPassenger tripModel, required String path}) async {
    return await _instance
        .collection('Passenger')
        .doc(auth.currentUser?.uid)
        .collection('Trip')
        .doc(path)
        .update(tripModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> updateTripPassengerF(
      {required TripModelPassenger tripModel,
      required String path,
      required String id}) async {
    return await _instance
        .collection('Passenger')
        .doc(id)
        .collection('Trip')
        .doc(path)
        .update(tripModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> updateTripInAllTrips(
      {required AllTripModel allTripModel, required String path}) async {
    return await _instance
        .collection('Trips')
        .doc(path)
        .update(allTripModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> updateJoining(
      {required JoiningPassenger joiningPassenger,
      required String path}) async {
    return await _instance
        .collection('Joining')
        .doc(auth.currentUser?.uid)
        .collection('trips')
        .doc(path)
        .update(joiningPassenger.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> addTripDriver({required TripModel tripModel}) async {
    return await _instance
        .collection('Users')
        .doc(auth.currentUser?.uid)
        .collection('Trip')
        .add(tripModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> joiningPassenger(
      {required JoiningPassenger joiningPassenger,
      required String path}) async {
    return await _instance
        .collection('Joining')
        .doc(path)
        .collection('trips')
        .add(joiningPassenger.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> addAllTrip({required AllTripModel allTripModel}) async {
    return await _instance
        .collection('Trips')
        .add(allTripModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> addNotifications(
      {required NotificationsModel notificationsModel}) async {
    return await _instance
        .collection('Users')
        .doc(auth.currentUser?.uid)
        .collection('Notifications')
        .add(notificationsModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> addTripPassenger({required TripModelPassenger tripModel}) async {
    // ??????????????????????????????????????
    return await _instance
        .collection('Passenger')
        .doc(auth.currentUser?.uid)
        .collection('Trip')
        .add(tripModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Stream<QuerySnapshot<TripModel>> readTripDriver(
      {required String path}) async* {
    yield* _instance
        .collection('Users')
        .doc(path)
        .collection('Trip')
        .withConverter<TripModel>(
          fromFirestore: (snapshot, options) =>
              TripModel.fromMap(snapshot.data()!),
          toFirestore: (TripModel tripModel, options) => TripModel().toMap(),
        )
        .snapshots();
  }

  Stream<QuerySnapshot<JoiningPassenger>> readNotifications() async* {
    yield* _instance
        .collection('Joining')
        .doc(auth.currentUser!.uid)
        .collection('trips')
        .withConverter<JoiningPassenger>(
            fromFirestore: (snapshot, options) =>
                JoiningPassenger.fromMap(snapshot.data()!),
            toFirestore: (JoiningPassenger joiningPassenger, options) =>
                joiningPassenger.toMap())
        .snapshots();
  }

  Stream<QuerySnapshot<TripModelPassenger>> readTripPassenger(
      {required String id}) async* {
    yield* _instance
        .collection('Passenger')
        .doc(id)
        .collection('Trip')
        .withConverter<TripModelPassenger>(
            fromFirestore: ((snapshot, options) =>
                TripModelPassenger.fromMap(snapshot.data()!)),
            toFirestore: (TripModelPassenger tripModel, options) =>
                TripModelPassenger().toMap())
        .snapshots();
  }

  Stream<QuerySnapshot<Collection>> readCollectionUsers() async* {
    yield* _instance
        .collection('Collection')
        .doc(auth.currentUser!.uid)
        .collection('SubCollection')
        .withConverter<Collection>(
            fromFirestore: ((snapshot, options) =>
                Collection.fromMap(snapshot.data()!)),
            toFirestore: (Collection collection, options) =>
                Collection().toMap())
        .snapshots();
  }

  Stream<DocumentSnapshot<Users>> readDriver() async* {
    yield* _instance
        .collection('Users')
        .doc(auth.currentUser!.uid)
        .withConverter<Users>(
            fromFirestore: (snapshot, options) =>
                Users.fromMap(snapshot.data()!),
            toFirestore: (Users users, options) => users.toMap())
        .snapshots();
  }

  Stream<DocumentSnapshot<Users>> readUsers({required String id}) async* {
    yield* _instance
        .collection('Users')
        .doc(id)
        .withConverter<Users>(
            fromFirestore: (snapshot, options) =>
                Users.fromMap(snapshot.data()!),
            toFirestore: (Users users, options) => users.toMap())
        .snapshots();
  }

  Stream<DocumentSnapshot<Users>> profileSearch({required String id}) async* {
    yield* _instance
        .collection('Users')
        .doc(id)
        .withConverter<Users>(
            fromFirestore: (snapshot, options) =>
                Users.fromMap(snapshot.data()!),
            toFirestore: (Users users, options) => users.toMap())
        .snapshots();
  }

  Stream<QuerySnapshot<Users>> read() async* {
    yield* _instance
        .collection('Users')
        .withConverter<Users>(
            fromFirestore: (snapshot, options) =>
                Users.fromMap(snapshot.data()!),
            toFirestore: (Users users, options) => users.toMap())
        .snapshots();
  }

  Stream<QuerySnapshot<AllTripModel>> readAllTrips() async* {
    yield* _instance
        .collection('Trips')
        .withConverter<AllTripModel>(
            fromFirestore: (snapshot, options) =>
                AllTripModel.fromMap(snapshot.data()!),
            toFirestore: (AllTripModel allTripModel, options) =>
                allTripModel.toMap())
        .snapshots();
  }

  Future<bool> deleteTripDriver({required String id}) async {
    return await _instance
        .collection('Users')
        .doc(auth.currentUser?.uid)
        .collection('Trip')
        .doc(id)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> deleteTripInAllTrips({required String id}) async {
    return await _instance
        .collection('Trips')
        .doc(id)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> deleteTripPassenger({required String id}) async {
    return await _instance
        .collection('Passenger')
        .doc(auth.currentUser?.uid)
        .collection('Trip')
        .doc(id)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> deleteCollection({required String id}) async {
    return await _instance
        .collection('Collection')
        .doc(auth.currentUser?.uid)
        .collection('SubCollection')
        .doc(id)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> addCollection(
      {required Collection collection, required String path}) async {
    return await _instance
        .collection('Collection')
        .doc(path)
        .collection('SubCollection')
        .add(collection.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }
}

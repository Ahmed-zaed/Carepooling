import 'package:carpooling_app/Model/messegeauth_firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<MessegeAuthFireBase> authWitheEmail(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      return _controllerFirebaseException(e);
    } catch (e) {}

    return MessegeAuthFireBase(messege: 'تم تسجيل الحساب بنجاح', error: false);
  }

  Future<MessegeAuthFireBase> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (exception) {
      return _controllerFirebaseException(exception);
    } catch (exception) {
      return MessegeAuthFireBase(messege: 'هناك خطأ ما', error: true);
    }

    return MessegeAuthFireBase(messege: 'أهلا  بك  بالتطبيق ', error: false);
  }

  MessegeAuthFireBase _controllerFirebaseException(
      FirebaseAuthException exception) {
    if (exception.code == 'email-already-in-use') {
      return MessegeAuthFireBase(
          messege: ' البريد الذي أدخلته موجود بالفعل', error: true);
    } else if (exception.code == 'invalid-email') {
      return MessegeAuthFireBase(messege: 'البريد غير صحيح', error: true);
    } else if (exception.code == 'operation-not-allowed') {
      return MessegeAuthFireBase(
          messege: 'غير مسموح بهذه العملية', error: true);
    } else if (exception.code == 'weak-password') {
      return MessegeAuthFireBase(messege: ' كلمة المرور ضعيفة ', error: true);
    } else if (exception.code == 'user-disabled') {
      return MessegeAuthFireBase(messege: ' الحساب معطل', error: true);
    } else if (exception.code == 'user-not-found') {
      return MessegeAuthFireBase(messege: ' المستخدم غير موجود', error: true);
    } else if (exception.code == 'wrong-password') {
      return MessegeAuthFireBase(messege: ' كلمة المرور خاظئة ', error: true);
    }
    return MessegeAuthFireBase(messege: 'هناك خطأ ما', error: true);
  }
}

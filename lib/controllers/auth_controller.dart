import 'package:firebase_auth/firebase_auth.dart';
import 'package:fuba_app/views/homepage/homepage.dart';
import 'package:get/get.dart';

import '../views/welcome.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const Welcome())
        : Get.offAll(() => const HomePage());
  }

  Future<String> createNewUser(
      {required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (i) {
      rethrow;
    }
  }

  Future<String> signInUser(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      return 'Success';
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (i) {
      rethrow;
    }
  }

  Future<String> signOutUser() async {
    try {
      await _auth.signOut();
      return 'Success';
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (i) {
      rethrow;
    }
  }
}

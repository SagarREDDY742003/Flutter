import 'package:blog_app/features/auth/domain/entities/app_user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepo extends AuthRepo {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<AppUser?> getCurrentUser() async {
    final firebaseUser = firebaseAuth.currentUser;
    if (firebaseUser == null) return null;
    return AppUser(
      uId: firebaseUser.uid,
      email: firebaseUser.email!,
      name: firebaseUser.displayName!,
    );
  }

  @override
  Future<AppUser?> login(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      AppUser user = AppUser(
        uId: userCredential.user!.uid,
        email: email,
        name: '',
      );
      return user;
    } catch (e) {
      throw Exception('login failed: $e');
    }
  }

  @override
  Future<void> logout() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<AppUser?> register(String name, String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      AppUser user = AppUser(
        uId: userCredential.user!.uid,
        email: email,
        name: name,
      );
      await firebaseFirestore
          .collection("users")
          .doc(user.uId)
          .set(user.toJson());
      return user;
    } catch (e) {
      throw Exception('login failed: $e');
    }
  }
}

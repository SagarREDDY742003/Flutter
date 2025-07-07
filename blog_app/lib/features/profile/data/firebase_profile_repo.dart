import 'package:blog_app/features/profile/domain/entities/profile_user.dart';
import 'package:blog_app/features/profile/domain/repository/profile_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseProfileRepo implements ProfileRepo {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<ProfileUser?> fetchUserProfile(String uId) async {
    try {
      final userDoc =
          await firebaseFirestore.collection("users").doc(uId).get();
      if (userDoc.exists) {
        final userData = userDoc.data();
        if (userData != null) {
          return ProfileUser(
            uId: userData['uId'],
            email: userData['email'],
            name: userData['name'],
            bio: userData['bio'] ?? '',
            profileImageUrl: userData['profileImageUrl'].toString(),
          );
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> updateProfile(ProfileUser updateProfile) async {
    try {
      await firebaseFirestore
          .collection("users")
          .doc(updateProfile.uId)
          .update({
            'bio': updateProfile.bio,
            'profileImageUrl': updateProfile.profileImageUrl,
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}

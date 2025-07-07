import 'package:blog_app/features/profile/domain/entities/profile_user.dart';

abstract class ProfileRepo {
  Future<ProfileUser?> fetchUserProfile(String uId);
  Future<void> updateProfile(ProfileUser updateProfile);
}

import 'package:blog_app/features/profile/domain/repository/profile_repo.dart';
import 'package:blog_app/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  //fetch user profile using repo
  Future<void> fetchUserProfile(String uId) async {
    try {
      emit(ProfileLoading());
      final user = await profileRepo.fetchUserProfile(uId);

      if (user != null) {
        emit(ProfileLoaded(user));
      } else {
        emit(ProfileError('User not found.'));
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  // update bio or profile image
  Future<void> updateProfile({
    required String uId,
    String? newBio,
    String? newProfileImageUrl,
  }) async {
    emit(ProfileLoading());
    try {
      final currentUser = await profileRepo.fetchUserProfile(uId);
      if (currentUser == null) {
        emit(ProfileError('Failed to fetch user for profile update.'));
        return;
      }

      // update new profile
      final  updatedProfile = currentUser.copyWith(
        newBio: newBio ?? currentUser.bio,
        newProfileImageUrl: newProfileImageUrl ?? currentUser.profileImageUrl,
      );
      // update in repo
      await profileRepo.updateProfile(updatedProfile);
      // re-fetch updated profile
      await fetchUserProfile(uId);
    } catch (e) {
      emit(ProfileError("Erroe updating profile $e"));
    }
  }
}

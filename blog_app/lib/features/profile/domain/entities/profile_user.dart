import 'package:blog_app/features/auth/domain/entities/app_user.dart';

class ProfileUser extends AppUser {
  final String bio;
  final String profileImageUrl;

  ProfileUser({
    required super.uId,
    required super.email,
    required super.name,
    required this.bio,
    required this.profileImageUrl,
  });

  // method to update profile user
  ProfileUser copyWith({String? newBio, String? newProfileImageUrl}) {
    return ProfileUser(
      uId: uId,
      email: email,
      name: name,
      bio: newBio ?? bio,
      profileImageUrl: newProfileImageUrl ?? profileImageUrl,
    );
  }

  // convert profileuser -> json
  @override
  Map<String, dynamic> toJson() {
    return {
      'uId': uId,
      'email': email,
      'name': name,
      'bio': bio,
      'profileImageUrl': profileImageUrl,
    };
  }

  // convert json -> profileuser
  factory ProfileUser.fromJson(Map<String, dynamic> json) {
    return ProfileUser(
      uId: json['uId'], 
      email: json['email'], 
      name: json['name'],
      bio: json['bio'], 
      profileImageUrl: json['profileImageUrl'], 
    );
  }
}

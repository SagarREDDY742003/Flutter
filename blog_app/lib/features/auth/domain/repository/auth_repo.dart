import 'package:blog_app/features/auth/domain/entities/app_user.dart';

/* AuthRepository - outlines possible auth operations for this app */

abstract class AuthRepo {
  Future<AppUser?> login(String email,String password);
  Future<AppUser?> register(String name,String email,String password);
  Future<AppUser?> getCurrentUser();
  Future<void> logout();
}

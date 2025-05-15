/* AuthCubit: state management */

import 'package:blog_app/features/auth/domain/entities/app_user.dart';
import 'package:blog_app/features/auth/domain/repository/auth_repo.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  final AuthRepo authRepo;
  AppUser? _currentUser;

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  //check if user is already authenticated
  void checkAuth() async {
    final user = await authRepo.getCurrentUser();
    if (user != null) {
      _currentUser = user;
      emit(Authenticated(user));
    } else {
      emit(Unauthenticaded());
    }
  }

  //get current user
  AppUser? get currentUser => _currentUser;

  //login
  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.login(email, password);
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(Unauthenticaded());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  //register
  Future<void> register(String name, String email, String password) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.register(name, email, password);
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(Unauthenticaded());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  //logout
  Future<void> logout() async {
    authRepo.logout();
    emit(Unauthenticaded());
  }
}

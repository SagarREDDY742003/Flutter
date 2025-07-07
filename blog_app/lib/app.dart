import 'package:blog_app/core/configs/themes/light_mode.dart';
import 'package:blog_app/features/auth/data/firebase_auth_repo.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_states.dart';
import 'package:blog_app/features/auth/presentation/pages/auth_page.dart';
import 'package:blog_app/features/home/presentation/pages/home_page.dart';
import 'package:blog_app/features/profile/data/firebase_profile_repo.dart';
import 'package:blog_app/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
App - Root Level
---------------------------------------------------------------------------------------
Repositories: for the database
    - firebase

Bloc providers: for stste management
    - auth
    - profile
    - post
    - search
    - theme

check auth state
    - unauthenticated -> login/register
    - authenticated -> home
*/

class MyApp extends StatelessWidget {
  final authRepo = FirebaseAuthRepo();
  final profileRepo = FirebaseProfileRepo();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // auth cubit
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
        ),
        // profile cubit
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(profileRepo: profileRepo),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        home: BlocConsumer<AuthCubit, AuthStates>(
          builder: (context, authState) {
            if (authState is Unauthenticaded) {
              return const AuthPage();
            }
            if (authState is Authenticated) {
              return const HomePage();
            }
            if (authState is AuthError) {
              return const AuthPage();
            }
            else{
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
          listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(
                context
              ).showSnackBar(SnackBar(content: Text('Login Failed. Please enter valid email and password. If not having account please register.')));
            }
          },
        ),
      ),
    );
  }
}

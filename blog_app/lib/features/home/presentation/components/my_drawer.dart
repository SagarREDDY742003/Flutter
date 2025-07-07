import 'package:blog_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:blog_app/features/home/presentation/components/my_drawer_tile.dart';
import 'package:blog_app/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //logo
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              // home tile
              MyDrawerTile(
                title: 'Home',
                icon: Icons.home,
                onTap: () => Navigator.of(context).pop(),
              ),

              // profile tile
              MyDrawerTile(
                title: 'Profile',
                icon: Icons.person,
                onTap: () {
                  // pop menu drawer
                  Navigator.of(context).pop();

                  // get current user id
                  final user = context.read<AuthCubit>().currentUser;
                  String? uId = user!.uId;
                  // navigate to profile page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(uId: uId),
                    ),
                  );
                },
              ),

              // search tile
              MyDrawerTile(title: 'Search', icon: Icons.search, onTap: () {}),

              // settings tile
              MyDrawerTile(
                title: 'Settings',
                icon: Icons.settings,
                onTap: () {},
              ),
              const Spacer(),

              // logout tile
              MyDrawerTile(
                title: 'Logout',
                icon: Icons.logout,
                onTap: () {
                  Navigator.of(context).pop();
                  context.read<AuthCubit>().logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

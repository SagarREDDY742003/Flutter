import 'package:blog_app/features/auth/domain/entities/app_user.dart';
import 'package:blog_app/features/auth/presentation/bloc/auth_cubit.dart';
import 'package:blog_app/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:blog_app/features/profile/presentation/bloc/profile_state.dart';
import 'package:blog_app/features/profile/presentation/components/bio_box.dart';
import 'package:blog_app/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  final String uId;
  const ProfilePage({super.key, required this.uId});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final authCubit = context.read<AuthCubit>();
  late final profileCubit = context.read<ProfileCubit>();

  //current user
  late AppUser? currentUser = authCubit.currentUser;

  // on startup
  @override
  void initState() {
    super.initState();
    profileCubit.fetchUserProfile(widget.uId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        //loaded
        if (state is ProfileLoaded) {
          // get loaded users
          final user = state.profileUser;
          return Scaffold(
            appBar: AppBar(
              title: Text("Profile"),
              centerTitle: true,
              foregroundColor: Theme.of(context).colorScheme.inversePrimary,
              actions: [
                IconButton(
                  onPressed:
                      () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePage(user: user),
                        ),
                      ),
                  icon: const Icon(Icons.settings),
                ),
              ],
            ),
            body: Column(
              children: [
                //profile image
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage('https://cdn-icons-png.flaticon.com/512/10542/10542486.png'),
                    ),
                  ),
                  // padding: EdgeInsets.all(25),
                ),
                const SizedBox(height: 25),
                //name
                Center(
                  child: Text(
                    user.name.toUpperCase(),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                //email
                Center(
                  child: Text(
                    user.email,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                //bio
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    children: [
                      Text(
                        "Bio",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                BioBox(text: user.bio),
                const SizedBox(height: 10),
                //post
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 0),
                  child: Row(
                    children: [
                      Text(
                        "Posts",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        //loading..
        else if (state is ProfileLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          return const Center(child: Text("No Profile found..."));
        }
      },
    );
  }
}

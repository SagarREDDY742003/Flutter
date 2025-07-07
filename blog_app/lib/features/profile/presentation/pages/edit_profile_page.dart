import 'package:blog_app/features/auth/presentation/components/my_text_field.dart';
import 'package:blog_app/features/profile/domain/entities/profile_user.dart';
import 'package:blog_app/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:blog_app/features/profile/presentation/bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfilePage extends StatefulWidget {
  final ProfileUser user;
  const EditProfilePage({super.key, required this.user});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final bioTextController = TextEditingController();
  final profileImgController = TextEditingController();

  // update profile button pressed
  void updateProfile() async {
    final profileCubit = context.read<ProfileCubit>();
    if (bioTextController.text.isNotEmpty) {
      profileCubit.updateProfile(
        uId: widget.user.uId,
        newBio: bioTextController.text,
        newProfileImageUrl: profileImgController.text
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator(), Text("Uploading...")],
              ),
            ),
          );
        } else {
          return buildEditPage();
        }
      },
      listener: (context, state) {
        if (state is ProfileLoaded) {
          Navigator.pop(context);
        }
      },
    );
  }

  Widget buildEditPage({double uploadProcess = 0.0}) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: updateProfile, icon: const Icon(Icons.upload)),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          // profile picture
          const Text("Profile Image"),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: MyTextField(
              controller: profileImgController,
              hintText: widget.user.profileImageUrl,
              obscureText: false,
            ),
          ),
          // bio
          const Text("Bio"),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: MyTextField(
              controller: bioTextController,
              hintText: widget.user.bio,
              obscureText: false,
            ),
          ),
        ],
      ),
    );
  }
}

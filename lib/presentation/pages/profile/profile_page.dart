import 'package:bwai_bandung_hackathon/presentation/pages/profile/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 20.0,
        ),
      ),
      body: Center(
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return state.when(
              initial: () => const SizedBox(),
              loading: () => const CircularProgressIndicator(),
              success: (user) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        user?.user?.userMetadata?['avatar_url'],
                      ),
                      radius: 64,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      user?.user?.userMetadata?['name'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(user?.user?.userMetadata?['email']),
                  ],
                );
              },
              failure: (message) {
                return const SizedBox();
              },
            );
          },
        ),
      ),
    );
  }
}

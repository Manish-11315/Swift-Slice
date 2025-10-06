import 'package:basic_food_delivery_app/logic/bloc/profile/profile_bloc.dart';
import 'package:basic_food_delivery_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewScreen extends StatefulWidget {
  const ProfileViewScreen({super.key});

  @override
  State<ProfileViewScreen> createState() => _ProfileViewScreenState();
}

class _ProfileViewScreenState extends State<ProfileViewScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(LoadProfile());
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: isDarkMode ? AppColors.darkBackgroundColor : AppColors.lightBackgroundColor,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ProfileLoaded) {
            return Column(
              children: [
                const SizedBox(height: 20),
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/branding/test_first.png'),
                ),
                const SizedBox(height: 10),
                Text(state.user.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(state.user.email, style: const TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      ProfileMenuItem(
                        icon: Icons.person_outline,
                        title: 'My Account',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        icon: Icons.history,
                        title: 'My Orders',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        icon: Icons.settings_outlined,
                        title: 'Settings',
                        onTap: () {},
                      ),
                      ProfileMenuItem(
                        icon: Icons.logout,
                        title: 'Logout',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          if (state is ProfileError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Something went wrong!'));
        },
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryColor),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

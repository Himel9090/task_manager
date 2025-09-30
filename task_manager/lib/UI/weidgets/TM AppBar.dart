import 'package:flutter/material.dart';
import 'package:task_manager/UI/Screens/Update_profile_screen.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool fromupdateProfile;

  const TMAppBar({super.key, this.fromupdateProfile = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: () {
          if (fromupdateProfile) {
            return; // Prevent navigation when already in UpdateProfileScreen
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UpdateProfileScreen(),
            ),
          );
        },
        child: Row(
          spacing: 8, // Flutter 3.7+
          children: [
            const CircleAvatar(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Full Name',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(color: Colors.white),
                ),
                Text(
                  "himel@gmail.com",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        IconButton(icon: const Icon(Icons.logout_outlined), onPressed: () {}),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

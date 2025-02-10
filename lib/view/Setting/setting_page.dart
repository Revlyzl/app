import 'package:app/view/Profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:app/widget/bottomNavbar.dart';
import 'package:get/get.dart';

class SettingContainer extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<SettingContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Settings', style: TextStyle(fontSize: 20)),
            Text('Configure as your preferences!',
                style: TextStyle(fontSize: 12, color: Colors.white)),
          ],
        ),
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Preferences',
            ),
            const SizedBox(height: 10),
            const Divider(),
            const Text(
              'Notifications',
            ),
            const SizedBox(height: 10),
            _buildSettingOption(
              icon: Icons.notifications,
              title: 'Enable Notifications',
              trailing: Switch(
                value: false,
                onChanged: (value) {},
              ),
            ),
            const Divider(),
            const Text(
              'Account',
            ),
            const SizedBox(height: 10),
            _buildSettingOption(
              icon: Icons.person,
              title: 'Edit Profile',
              onTap: () {
                Get.offAll(() => const ProfileContainer());
                // Get.offAll(() => ProfilePage());
              },
            ),
            const Divider(),
            const Text(
              'About',
            ),
            const SizedBox(height: 10),
            _buildSettingOption(
              icon: Icons.info,
              title: 'About App',
              onTap: () {},
            ),
            _buildSettingOption(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                _showLogoutConfirmationDialog(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}

Widget _buildSettingOption({
  required IconData icon,
  required String title,
  Widget? trailing,
  VoidCallback? onTap,
}) {
  return ListTile(
    leading: Icon(icon, color: Colors.red),
    title: Text(title),
    trailing: trailing,
    onTap: onTap,
  );
}

void _showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Add logout logic here
              Navigator.pop(context);
              Get.offAllNamed('/login');
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },
  );
}

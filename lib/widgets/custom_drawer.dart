import 'package:flutter/material.dart';

import '../screens/login_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // Header with user info
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            accountName: Row(
              children: [
                Text(username, style: TextStyle(fontSize: 18)),
                SizedBox(width: 8),
                Text("• Personal", style: TextStyle(fontSize: 14)),
              ],
            ),
            accountEmail: Text(email),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blue, size: 30),
            ),
          ),

          // Main menu items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(Icons.rocket_launch_outlined, 'Getting Started',),
                _buildDrawerItem(Icons.sync, 'Sync Data'),
                _buildDrawerItem(Icons.videogame_asset_outlined, 'Gamification',),
                _buildDrawerItem(Icons.call, 'Send Logs'),
                _buildDrawerItem(Icons.settings, 'Settings'),
                _buildDrawerItem(Icons.help_outline, 'Help?'),
                _buildDrawerItem(Icons.cancel, 'Cancel Subscription'),

                Divider(thickness: 1, height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('App Info', style: TextStyle(color: Colors.blue)),
                ),

                _buildDrawerItem(Icons.info_outline, 'About Us'),
                _buildDrawerItem(Icons.privacy_tip_outlined, 'Privacy Policy'),
                _buildDrawerItem(Icons.verified_outlined, 'Version 1.01.52'),
                _buildDrawerItem(Icons.share, 'Share App'),
                _buildDrawerItem(Icons.logout, 'Logout'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: Colors.grey.shade200,
        child: Icon(icon, color: Colors.black87, size: 18),
      ),
      title: Text(title, style: TextStyle(fontSize: 15)),
      onTap: () {
        // Add your navigation or action logic here
      },
    );
  }
}

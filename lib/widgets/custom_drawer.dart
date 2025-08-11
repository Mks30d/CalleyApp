import 'package:calley_app/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../utils/utils.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: secondaryColor,
      child: Column(
        children: [
          // Header with user info
          ListTile(
            tileColor: primaryColor,
            contentPadding: EdgeInsets.fromLTRB(20, 30, 11, 8),
            title: Row(
              children: [
                Text(
                  username,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                SizedBox(width: 8),
                Text(
                  "- Personal",
                  style: TextStyle(color: Colors.yellowAccent, fontSize: 14),
                ),
              ],
            ),
            subtitle: Text(
              email,
              style: TextStyle(
                color: whiteShadeColor,
                // fontSize: 17,
                // fontWeight: FontWeight.bold,
              ),
            ),
            leading: Image(
              image: AssetImage("lib/assets/profile.png"),
              width: 45,
            ),
          ),

          // Main menu items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                  Icons.rocket_launch_outlined,
                  'Getting Started',
                  () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DashboardScreen(),
                      ),
                    );
                  },
                ),
                _buildDrawerItem(Icons.sync, 'Sync Data', () => {}),
                _buildDrawerItem(
                  Icons.videogame_asset_outlined,
                  'Gamification',
                  () => {},
                ),
                _buildDrawerItem(Icons.call, 'Send Logs', () => {}),
                _buildDrawerItem(Icons.settings, 'Settings', () => {}),
                _buildDrawerItem(Icons.help_outline, 'Help?', () => {}),
                _buildDrawerItem(Icons.cancel, 'Cancel Subscription', () => {}),

                Divider(thickness: 1, height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('App Info', style: TextStyle(color: Colors.blue)),
                ),

                _buildDrawerItem(Icons.info_outline, 'About Us', () => {}),
                _buildDrawerItem(
                  Icons.privacy_tip_outlined,
                  'Privacy Policy',
                  () => {},
                ),
                _buildDrawerItem(
                  Icons.verified_outlined,
                  'Version 1.01.52',
                  () => {},
                ),
                _buildDrawerItem(Icons.share, 'Share App', () => {}),
                _buildDrawerItem(Icons.logout, 'Logout', () => {}),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, Function btnFunction) {
    return ListTile(
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: Colors.white,
        child: Icon(icon, color: Colors.black87, size: 18),
      ),
      title: Text(title, style: TextStyle(fontSize: 15)),
      onTap: btnFunction as GestureTapCallback,
    );
  }
}

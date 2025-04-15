import 'package:flutter/material.dart';
import '../utils/profile_menu.dart' show ProfileMenu;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void showSimpleDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("Notification"),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              ),
            ],
          ),
    );
  }

  // item name, icon
  List<List<dynamic>> menuItems(BuildContext context) => [
    [
      "Edit Profil",
      Icons.mode_edit_outline_outlined,
      () =>
          showSimpleDialog(context, "Edit Profile Page has not been made yet"),
    ],
    [
      "Security Settings",
      Icons.lock_outline,
      () =>
          showSimpleDialog(context, "Security Settings is under development."),
    ],
    [
      "Statistics",
      Icons.bolt,
      () => showSimpleDialog(context, "Statistics Page has not been made yet."),
    ],
    [
      "Notification",
      Icons.notifications_none,
      () => showSimpleDialog(context, "No new notifications."),
    ],
    [
      "Help",
      Icons.help_outline_rounded,
      () => showSimpleDialog(context, "Contact support at help@smarthome.com"),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Text(
            'P R O F I L E',
            style: TextStyle(
              color: Color(0xff0e5250),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0, // <- Hapus efek bayangan/elevation
        scrolledUnderElevation: 0, // <- Untuk versi Flutter terbaru (3.10+)
      ),

      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
        children: [
          Center(
            child: Column(
              children: [
                Image.asset(
                  'lib/icons/avatar.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Ilhan Juldan',
                  style: TextStyle(fontSize: 24, color: Color(0xff0e5250)),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          ...menuItems(context).map(
            (item) => ProfileMenu(
              itemName: item[0],
              iconData: item[1],
              onTap: item[2],
            ),
          ),
        ],
      ),
    );
  }
}

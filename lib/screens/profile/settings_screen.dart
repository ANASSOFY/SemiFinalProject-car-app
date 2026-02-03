import 'package:flutter/material.dart';
import '../../main.dart'; // ThemeNotifier
import 'package:car_store/screens/profile/settings_screen.dart';
import 'package:car_store/screens/profile/settings_screen.dart';
import 'package:provider/provider.dart';


class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: themeNotifier.isDarkMode ? Colors.black87 : Colors.orangeAccent,
      ),
      backgroundColor: themeNotifier.isDarkMode ? Colors.black : Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: themeNotifier.isDarkMode,
            onChanged: (value) {
              themeNotifier.toggleTheme();
            },
            secondary: Icon(themeNotifier.isDarkMode ? Icons.dark_mode : Icons.light_mode, color: Colors.orangeAccent),
          ),
          const SizedBox(height: 20),
          SwitchListTile(
            title: const Text("Enable Notifications"),
            value: true,
            onChanged: (value) {},
            secondary: const Icon(Icons.notifications_active, color: Colors.orangeAccent),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.person, color: Colors.orangeAccent),
            title: const Text("Edit Profile"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.lock, color: Colors.orangeAccent),
            title: const Text("Security"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {},
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.info_outline, color: Colors.orangeAccent),
            title: const Text("About"),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "Car Store App",
                applicationVersion: "1.0.0",
                children: const [Text("This is a demo marketplace app for second-hand cars.")],
              );
            },
          ),
        ],
      ),
    );
  }
}

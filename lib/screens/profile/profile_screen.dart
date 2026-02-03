import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../auth/landing_screen.dart';
import 'package:car_store/screens/profile/settings_screen.dart';
import '../../main.dart'; // ThemeNotifier
import 'package:car_store/screens/buy/payment_screen.dart'; 

class ProfilePage extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final String role;
  const ProfilePage({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.role,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String _name;
  late String _email;
  late String _phone;
  late String _role;
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _name = widget.nameController.text;
    _email = widget.emailController.text;
    _phone = widget.phoneController.text;
    _role = widget.role.isNotEmpty ? widget.role : 'Buyer';
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final isDark = themeNotifier.isDarkMode;

    // Colors حسب الثيم
    final backgroundColor = isDark ? Colors.black : const Color(0xFFF8F9FD);
    final cardColor = isDark ? Colors.grey[900] : Colors.white;
    final textDark = isDark ? Colors.white : const Color(0xFF2D3436);
    final textLight = isDark ? Colors.grey[400] : const Color(0xFF9E9E9E);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, size: 20, color: textDark),
                        onPressed: () {
                          if (Navigator.canPop(context)) Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => _showImageSourceActionSheet(context),
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                              child: _profileImage == null
                                  ? Icon(Icons.person, size: 60, color: Colors.white)
                                  : null,
                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.edit, color: Colors.orangeAccent, size: 16),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_name,
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: textDark)),
                            const SizedBox(height: 5),
                            Text(_role, style: TextStyle(fontSize: 14, color: textLight)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  _ContactItem(icon: Icons.phone, text: _phone, textColor: textDark, iconColor: Colors.orangeAccent),
                  const SizedBox(height: 15),
                  _ContactItem(icon: Icons.email, text: _email, textColor: textDark, iconColor: Colors.orangeAccent),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: _ProfileMenu(textDark: textDark),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color textColor;
  final Color iconColor;
  const _ContactItem({required this.icon, required this.text, required this.textColor, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor, size: 22),
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: textColor))),
      ],
    );
  }
}

class _ProfileMenu extends StatelessWidget {
  final Color textDark;
  const _ProfileMenu({required this.textDark});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      children: [
        _MenuItem(icon: Icons.favorite_border, text: "Favorites", onTap: () {}),
        _MenuItem(
          icon: Icons.account_balance_wallet_outlined,
          text: "Payments",
          onTap: () {
            // 👈 Navigate to PaymentScreen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const PaymentScreen(),
                // لو عندك بيانات سيارة تقدر تمررها كـ car: carData
              ),
            );
          },
        ),
        _MenuItem(
          icon: Icons.edit_outlined,
          text: "Setting",
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingPage()));
          },
        ),
        _MenuItem(
          icon: Icons.logout,
          text: "Logout",
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (_) => const LandingScreen()), (route) => false);
          },
        ),
      ],
    );
  }
}

class _MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const _MenuItem({required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: Colors.orangeAccent, size: 28),
      title: Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    );
  }
}

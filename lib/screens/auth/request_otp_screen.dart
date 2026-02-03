import 'package:flutter/material.dart';
import '../profile/profile_screen.dart';

class RequestOtpScreen extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String role;

  const RequestOtpScreen({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
  });

  @override
  State<RequestOtpScreen> createState() => _RequestOtpScreenState();
}

class _RequestOtpScreenState extends State<RequestOtpScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    emailController = TextEditingController(text: widget.email);
    phoneController.text = widget.phone;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Verify Your Phone",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "We’ll send you a verification code",
                  style: TextStyle(color: Colors.white.withOpacity(0.7)),
                ),
                const SizedBox(height: 32),

                /// Phone Field
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(color: Colors.white),
                  maxLength: 11,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone number is required";
                    }
                    if (value.length != 11) {
                      return "Phone number must be 11 digits";
                    }
                    if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                      return "Only numbers are allowed";
                    }
                    return null;
                  },
                  decoration: _inputDecoration(
                    hint: "Phone Number",
                    icon: Icons.phone_outlined,
                  ),
                ),

                const SizedBox(height: 32),

                /// Send OTP
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProfilePage(
                              nameController: nameController,
                              emailController: emailController,
                              phoneController: phoneController,
                              role: widget.role,
                            ),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      "Send OTP",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                /// Divider OR
                Row(
                  children: [
                    Expanded(
                      child: Divider(color: Colors.white.withOpacity(0.3)),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "OR",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    Expanded(
                      child: Divider(color: Colors.white.withOpacity(0.3)),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                /// Create New Account
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context); // يرجع Create Account
                    },
                    child: Text(
                      "Create new account",
                      style: TextStyle(
                        color: Colors.orangeAccent.withOpacity(0.9),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

InputDecoration _inputDecoration({
  required String hint,
  required IconData icon,
}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
    prefixIcon: Icon(icon, color: Colors.white.withOpacity(0.7)),
    filled: true,
    fillColor: Colors.white.withOpacity(0.1),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide.none,
    ),
  );
}

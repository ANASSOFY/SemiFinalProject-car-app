import 'package:car_store/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../../widgets/cards/sign_up_with_card.dart';
import 'verify_otp_screen.dart';
import 'create_account_screen.dart';
import '../../widgets/button_app.dart';
import '../../widgets/text_field_app.dart';
import '../../widgets/gradient_container.dart';
import '../../widgets/custom_text_rich.dart';
import '../../widgets/custom_text_with_click.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController roleController;

  const LoginScreen({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.roleController,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneFieldController =
    TextEditingController(text: phoneController.text);

    return Scaffold(
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/images/carr.jpg',
              fit: BoxFit.cover,
            ),
          ),

          const GradientContainer(),

          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextRich(
                  text1: "Welcome ",
                  text2: nameController.text,
                ),

                const SizedBox(height: 60),

                TextFieldApp(
                  title: "Enter your Mobile no",
                  hintText: "Enter phone no",
                  keyboardType: TextInputType.phone,
                  obscureText: false,
                  inputFormatters: const [],
                  controller: phoneFieldController,
                ),

                const SizedBox(height: 40),

                ButtonApp(
                  title: "Get OTP",
                  onPressed: () {
                    phoneController.text = phoneFieldController.text;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => VerifyOtpScreen(
                          nameController: nameController,
                          emailController: emailController,
                          phoneController: phoneController,
                          roleController: roleController,
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                CustomTextWithClick(
                  text1: "Create a new ",
                  text2: "account",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contex) => const CreateAccountScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Or",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
                SizedBox(height: 50),
                SignUpWithCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

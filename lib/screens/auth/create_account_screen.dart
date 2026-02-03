import 'package:car_store/widgets/custom_app_bar.dart';
import 'package:car_store/widgets/custom_text_with_click.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import '../../widgets/button_app.dart';
import '../../widgets/text_field_app.dart';
import '../../widgets/gradient_container.dart';
import '../../widgets/custom_text_rich.dart';
import '../../utils/validators.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset('assets/images/carr.jpg', fit: BoxFit.cover),
          ),

          const GradientContainer(),

          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextRich(text1: "Create an ", text2: "account"),
                const SizedBox(height: 20),
                TextFieldApp(
                  title: "Full Name",
                  hintText: "Enter your name",
                  keyboardType: TextInputType.name,
                  obscureText: false,
                  controller: nameController,
                  inputFormatters: const [],
                ),
                const SizedBox(height: 20),
                TextFieldApp(
                  title: "Email Address",
                  hintText: "Enter your email",
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  controller: emailController,
                  inputFormatters: const [],
                ),
                const SizedBox(height: 20),
                TextFieldApp(
                  title: "Mobile Number",
                  hintText: "Enter your mobile no",
                  keyboardType: TextInputType.phone,
                  obscureText: false,
                  controller: phoneController,
                  inputFormatters: const [],
                ),
                const SizedBox(height: 20),
                TextFieldApp(
                  title: "Password",
                  hintText: "Enter your password",
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  controller: passwordController,
                  inputFormatters: const [],
                ),
                const SizedBox(height: 32),
                ButtonApp(
                  title: "Create an account",
                  onPressed: () {
                    String? nameError = Validators.validateName(
                      nameController.text,
                    );
                    String? emailError = Validators.validateEmail(
                      emailController.text,
                    );
                    String? phoneError = Validators.validatePhone(
                      phoneController.text,
                    );
                    String? passwordError = Validators.validatePassword(
                      passwordController.text,
                    );

                    if (nameError != null) {
                      showMessage(nameError);
                      return;
                    }

                    if (emailError != null) {
                      showMessage(emailError);
                      return;
                    }

                    if (phoneError != null) {
                      showMessage(phoneError);
                      return;
                    }

                    if (passwordError != null) {
                      showMessage(passwordError);
                      return;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LoginScreen(
                          nameController: nameController,
                          emailController: emailController,
                          phoneController: phoneController,
                          roleController: passwordController,
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 24),
                CustomTextWithClick(
                  text1: "Already have an account ",
                  text2: "Login",
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(
                        nameController: nameController,
                        emailController: emailController,
                        phoneController: phoneController,
                        roleController: roleController,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

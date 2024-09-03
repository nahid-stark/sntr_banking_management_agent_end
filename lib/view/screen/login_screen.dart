import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sntr_banking_management_agent_end/controller/login_controller.dart';
import 'package:sntr_banking_management_agent_end/view/screen/main_drawer_screen.dart';
import 'package:sntr_banking_management_agent_end/view/widgets/app_logo.dart';
import 'package:sntr_banking_management_agent_end/view/widgets/snackbar_message.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureTextEnabled = true;
  final TextEditingController _userAccountNoTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          width: 800,
          child: Card(
            elevation: 20,
            child: Column(
              children: [
                const AppLogo(),
                const Text(
                  "Login Into Your Agent Account",
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 12),
                _buildForm(),
                const SizedBox(height: 26),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 180),
                  child: GetBuilder<LoginController>(
                    builder: (loginController) {
                      if(loginController.inProgress) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size.fromWidth(double.maxFinite),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () async {
                          if(_formKey.currentState!.validate()) {
                            bool result = await loginController.login(_userAccountNoTEController.text.trim(), _passwordTEController.text.trim());
                            if(result) {
                              SnackBarMessage.snackbarMessage(title: "Login Complete", message: "", type: true);
                              Get.to(() => const MainDrawerScreen());
                            } else {
                              SnackBarMessage.snackbarMessage(title: "ID or Password Incorrect", message: "", type: false);
                            }
                          }
                        },
                        child: const Text("Login"),
                      );
                    }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 100),
        child: Column(
          children: [
            TextFormField(
              validator: (String? value) {
                if (value?.isEmpty ?? true) {
                  return "Enter Agent Account No.";
                }
                return null;
              },
              controller: _userAccountNoTEController,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/icons/user_name.png",
                    height: 20,
                    width: 20,
                    color: Colors.blue,
                  ),
                ),
                hintText: "Agent Account No.",
                labelText: "Agent Account No.",
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              validator: (String? value) {
                if (value?.isEmpty ?? true) {
                  return "Enter Agent Account Password";
                }
                return null;
              },
              controller: _passwordTEController,
              obscureText: _obscureTextEnabled,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                hintText: "Password",
                labelText: "Password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/icons/password.png",
                    height: 20,
                    width: 20,
                    color: Colors.blue,
                  ),
                ),
                suffix: SizedBox(
                  height: 30,
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {
                      _obscureTextEnabled = !_obscureTextEnabled;
                      setState(() {});
                    },
                    icon: Icon(
                      _obscureTextEnabled ? Icons.visibility_off_outlined : Icons.remove_red_eye_outlined,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:volunteer_referral/screens/patients_list_screen.dart';
import 'package:volunteer_referral/widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void handleLogIn(BuildContext context) {
    print("hello");
    print(usernameController.text);
    print(passwordController.text);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PatientsListScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.health_and_safety,
                  size: 150,
                  color: Colors.blueAccent,
                ),
                const Text(
                  "UNION",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: CustomTextField(
                    hintText: "Username",
                    obscureText: false,
                    controller: usernameController,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: CustomTextField(
                    hintText: "Password",
                    obscureText: true,
                    controller: passwordController,
                  ),
                ),
                CustomButton(
                  onTap: () {
                    handleLogIn(context);
                  },
                  buttonName: "Login",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

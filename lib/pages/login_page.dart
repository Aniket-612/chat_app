import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  //tap to go to register page
  final Function()? onTap;

  LoginPage({super.key, required this.onTap});

  void login(BuildContext context) async {
    //auth service
    final authService = AuthService();

    try {
      await authService.signInwithEmailPassword(
          _emailcontroller.text, _passwordcontroller.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //logo
                Icon(
                  Icons.chat,
                  size: 60,
                  color: Theme.of(context).colorScheme.primary,
                ),
                //welcome back message
                const SizedBox(height: 50),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),
                //email textfield
                const SizedBox(height: 25),
                Mytextfield(
                  hinttext: "Enter your email...",
                  obscureText: false,
                  controller: _emailcontroller,
                ),
                const SizedBox(height: 15),
                Mytextfield(
                  hinttext: "Password",
                  obscureText: true,
                  controller: _passwordcontroller,
                ),
                const SizedBox(height: 25),
                MyButton(text: "Login", onTap: () => login(context)),
                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not a member.",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary)),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        "Register Now?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

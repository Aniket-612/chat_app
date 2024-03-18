import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RegisterPage extends StatelessWidget {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _confirmpasswordcontroller = TextEditingController();

  final Function()? onTap;

  RegisterPage({super.key, required this.onTap});
  void register() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
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
                "Let's Create an account for you",
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
              const SizedBox(height: 10),
              Mytextfield(
                hinttext: "Password",
                obscureText: true,
                controller: _passwordcontroller,
              ),
              const SizedBox(height: 10),
              Mytextfield(
                  hinttext: "Confirm Password",
                  obscureText: true,
                  controller: _confirmpasswordcontroller),
              const SizedBox(height: 25),
              MyButton(text: "Register", onTap: register),
              const SizedBox(height: 25),

              //pw textfield

              //login page

              //register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have an account?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary)),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Login Now.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}

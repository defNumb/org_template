import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs/authentication/authentication_bloc.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    // text controllers
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    // return a scaffold with a center widget
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        // Container with round corners, and fields with rounded corners for email and password,and buttos for sign in and sign up
        child: Container(
          height: 400,
          width: 400,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).canvasColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // EMAIL FIELD
              Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Email',
                  ),
                  controller: emailController,
                  onChanged: (value) {
                    emailController.text = value;
                  },
                ),
              ),
              // PASSWORD FIELD
              Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Password',
                  ),
                  controller: passwordController,
                  onChanged: (value) {
                    passwordController.text = value;
                  },
                ),
              ),
              // sign in button
              Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    context.read<AuthenticationBloc>().add(
                          AuthenticationSignInRequested(
                            email: emailController.text,
                            password: passwordController.text,
                          ),
                        );
                  },
                  child: const Text('Sign In'),
                ),
              ),
              // sign up button
              Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Sign Up'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

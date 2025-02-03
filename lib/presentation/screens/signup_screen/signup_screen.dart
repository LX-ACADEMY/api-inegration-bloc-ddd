import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/application/auth/sign_up_form/bloc/sign_up_form_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                context
                    .read<SignUpFormBloc>()
                    .add(SignUpFormEvent.nameChanged(value));
              },
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                context
                    .read<SignUpFormBloc>()
                    .add(SignUpFormEvent.emailChanged(value));
              },
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              onChanged: (value) {
                context
                    .read<SignUpFormBloc>()
                    .add(SignUpFormEvent.passwordChanged(value));
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                context
                    .read<SignUpFormBloc>()
                    .add(SignUpFormEvent.signUpButtonPressed());
              },
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

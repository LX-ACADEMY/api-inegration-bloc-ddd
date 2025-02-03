import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/application/auth/sign_up_form/bloc/sign_up_form_bloc.dart';
import 'package:todo_app/presentation/screens/home_screen/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpFormBloc, SignUpFormState>(
      listenWhen: (previous, current) =>
          previous.failureOrSuccessOption != current.failureOrSuccessOption,
      listener: (context, state) {
        state.failureOrSuccessOption.fold(
          () => null,
          (either) => either.fold(
            (l) => FlushbarHelper.createError(
              // duration: Duration(minutes: 3),
              message: l.map(
                clientFailure: (f) => f.message,
                serverFailure: (f) => f.message,
              ),
            ).show(context),
            (r) => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (_) => HomeScreen(),
            )),
          ),
        );
      },
      child: Scaffold(
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
      ),
    );
  }
}

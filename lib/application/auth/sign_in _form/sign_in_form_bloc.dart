import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/domain/auth/credential.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  SignInFormBloc() : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) {
      event.map(
        emailChanged: (e) {
          emit(
            state.copyWith(
              credential: state.credential.copyWith(
                email: e.emailStr,
              ),
            ),
          );
        },
        passwordChanged: (e) {
          emit(
            state.copyWith(
              credential: state.credential.copyWith(
                password: e.passwordStr,
              ),
            ),
          );
        },
        signInButtonPressed: (e) {
          print(
            state.toString(),
          );
        },
      );
    });
  }
}

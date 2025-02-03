// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/domain/auth/sign_up_credencial/sign_up_credencial.dart';

part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';
part 'sign_up_form_bloc.freezed.dart';

@injectable
class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  SignUpFormBloc() : super(SignUpFormState.initial()) {
    on<SignUpFormEvent>((event, emit) {
      event.map(
        emailChanged: (e) {
          emit(
            state.copyWith(
              signUpCredencial: state.signUpCredencial.copyWith(
                email: e.email,
              ),
            ),
          );
        },
        nameChanged: (e) {
          emit(
            state.copyWith(
              signUpCredencial: state.signUpCredencial.copyWith(
                name: e.name,
              ),
            ),
          );
        },
        passwordChanged: (e) {
          emit(
            state.copyWith(
                signUpCredencial:
                    state.signUpCredencial.copyWith(password: e.passwordStr)),
          );
        },
        signUpButtonPressed: (e) {},
      );
    });
  }
}

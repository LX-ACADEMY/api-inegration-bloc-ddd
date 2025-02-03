import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/domain/auth/failures/auth_failure.dart';
import 'package:todo_app/domain/auth/i_auth_repository.dart';
import 'package:todo_app/domain/auth/sign_up_credencial/sign_up_credencial.dart';
import 'package:todo_app/domain/models/token_model/token_model.dart';

part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';
part 'sign_up_form_bloc.freezed.dart';

@injectable
class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  final IAuthRepository _authRepository;
  SignUpFormBloc(this._authRepository) : super(SignUpFormState.initial()) {
    on<SignUpFormEvent>((event, emit) async {
      await event.map(
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
        signUpButtonPressed: (e) async {
          emit(state.copyWith(
            isloading: true,
            failureOrSuccessOption: none(),
          ));

          final failureOrSuccess =
              await _authRepository.signUp(state.signUpCredencial);

          failureOrSuccess.fold(
            (l) => emit(state.copyWith(
              isloading: false,
              failureOrSuccessOption: some(left(l)),
            )),
            (r) {
              log(r.toString());
              emit(state.copyWith(
                isloading: false,
                authToken: r,
                failureOrSuccessOption: some(right(r)),
              ));
            },
          );
        },
      );
    });
  }
}

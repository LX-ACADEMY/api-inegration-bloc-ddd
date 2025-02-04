import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/domain/auth/failures/auth_failure.dart';
import 'package:todo_app/domain/auth/i_auth_repository.dart';
import 'package:todo_app/domain/auth/sign_in_credencial/credential.dart';
import 'package:todo_app/domain/models/token_model/token_model.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthRepository _authRepository;
  SignInFormBloc(this._authRepository) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) async {
      await event.map(
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
        signInButtonPressed: (e) async {
          emit(state.copyWith(
            isloading: true,
            failureOrSuccessOption: none(),
          ));

          final failureOrSuccess =
              await _authRepository.signin(state.credential);

          failureOrSuccess.fold(
            (l) => emit(state.copyWith(
              isloading: false,
              failureOrSuccessOption: some(left(l)),
            )),
            (r) {
              print(r);
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

part of 'sign_up_form_bloc.dart';

@freezed
class SignUpFormState with _$SignUpFormState {
  const factory SignUpFormState({
    required bool isloading,
    required SignUpCredencial signUpCredencial,
  }) = _SignUpFormState;
  factory SignUpFormState.initial() => SignUpFormState(
        isloading: false,
        signUpCredencial: SignUpCredencial.empty(),
      );
}

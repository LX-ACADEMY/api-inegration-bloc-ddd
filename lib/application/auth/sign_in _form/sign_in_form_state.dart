part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required bool isloading,
    required Credential credential,
  }) = _SignInFormState;
  factory SignInFormState.initial() => SignInFormState(
        isloading: false,
        credential: Credential.empty(),
      );
}

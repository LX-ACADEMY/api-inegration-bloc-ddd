part of 'sign_in_form_bloc.dart';

@freezed
class SignInFormState with _$SignInFormState {
  const factory SignInFormState({
    required bool isloading,
    required Credential credential,
    required TokenModel? authToken,
    required Option<Either<AuthFailure, TokenModel>> failureOrSuccessOption,
  }) = _SignInFormState;
  factory SignInFormState.initial() => SignInFormState(
        isloading: false,
        credential: Credential.empty(),
        authToken: null,
        failureOrSuccessOption: none(),
      );
}
